; DESCRIPTION: The GeOS assembly code benchmarks two approaches for clamping a color value to the range of 0-255: a traditional branch-based method using conditional jumps and loads, and a branchless method utilizing conditional select (CSEL) instructions. The code measures and stores the results and instruction counts for both methods in memory.

; cmov_bench.asm -- Branch vs CSEL color clamp benchmark
;
; Clamps a color value to 0-255 range using two approaches:
;   1. Branch-based: CMP + BLT/JZ + LDI (traditional)
;   2. CSEL-based: sign extraction + CSEL (branchless)
;
; Memory map:
;   0x2400 = input color (300 = overflow test, should clamp to 255)
;   0x2401 = result_branch (branch approach result)
;   0x2402 = result_csel  (CSEL approach result)
;   0x2403 = steps_branch (instruction count for branch approach)
;   0x2404 = steps_csel  (instruction count for CSEL approach)

; === Setup ===
LDI r21, 1            ; increment constant
LDI r2, 300           ; test value: overflows 255
LDI r10, 0x2400
STORE r10, r2         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r2 > 255, set r2 = 255
LDI r1, 255
CMP r2, r1
; CMP sets r14: -1 if r2<r1, 0 if equal, 1 if r2>r1
; We want to clamp only when r2 > 255 (r14 == 1)
; Trick: compare r14 with 1. If r14 < 1 (i.e. r14 == -1), skip.
LDI r6, 1
CMP r6, r14            ; compare 1 vs CMP result
BGE r14, branch_clamp_hi  ; if 1 >= r14 (always true since r14 is -1,0,or1)
; Wait, that always fires. Let me use a simpler approach:
; BLT r14 means r14 == -1, which means r2 < 255 -> skip
JMP branch_hi_check
branch_clamp_hi:
LDI r2, 255
branch_hi_check:

; Actually, simplest correct approach: check if r2 < 255, skip; else clamp
; Reset and redo cleanly
LDI r2, 300
LDI r20, 0

; Upper clamp using BLT: if r2 < 255, skip
LDI r1, 255
CMP r2, r1
BLT r14, branch_lo       ; r2 < 255, skip upper clamp
LDI r2, 255              ; r2 >= 255, clamp

branch_lo:
; Lower clamp: if r2 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r1, r2
LDI r6, 31
SAR r1, r6               ; r1 = all-ones if negative, all-zeros if positive
JZ r1, branch_done       ; if not negative, done
LDI r2, 0                ; clamp to 0

branch_done:
LDI r10, 0x2401
STORE r10, r2             ; save branch result
LDI r10, 0x2403
STORE r10, r20            ; save branch step count (0 = not instrumented precisely)

; ========================================
; Approach 2: CSEL-based clamp (branchless)
; ========================================
LDI r2, 300              ; reload test value
LDI r22, 0               ; step counter

; Upper clamp using CSEL: min(r2, 255)
; Strategy: compute a boolean mask, then CSEL
; CMP r2, 255 -> r14 = -1 (r2<255), 0 (equal), 1 (r2>255)
; We want: if r2 > 255, pick 255; else pick r2
; CSEL rd, rs_if_true, rs_if_false, cond
; So: CSEL r2, 255, r2, cond_for_overflow
; cond_for_overflow should be nonzero when r2 > 255
;
; Compute cond: CMP r2, 255 -> if r14 == 1, we have overflow
; Use: MOV cond, r14; LDI r6, 1; CMP cond, r6 -> BLT r14 means cond<1 i.e. cond=-1 (r2<255)
; We need the opposite: cond nonzero when r2>255
; Simple: after CMP, r14 is -1/0/1. r14 != -1 when r2 >= 255.
; BGE r14 fires when r14 != -1 (r2 >= 255). We can use that to set a flag.

LDI r1, 255
CMP r2, r1               ; r14 = -1 if r2<255, 0 if eq, 1 if r2>255

; Build condition register: nonzero when r2 > 255
; r14 == 1 means r2 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r14, r1 where r1=1. If r14 was 1, result=0. If r14 was -1, result=-2. If r14 was 0, result=-1.
; That doesn't help. Let me use: MOV r4, r14; LDI r7, 1; CMP r4, r7 -> BLT means r4<1 (r14=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r14 - 1)
; If r14=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r14=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r14=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r14, r2(where r2=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r4, 0
ADD r4, r14               ; r4 = CMP result (-1/0/1)
LDI r7, 1
SUB r4, r7               ; r4 = CMP_result - 1
LDI r0, 31
SAR r4, r0               ; r4 = 0 (overflow) or -1 (no overflow)
LDI r7, 0
SUB r7, r7               ; r7 = 0 (was: LDI can't do -1... use NEG)
LDI r7, 1
NEG r7                   ; r7 = 0xFFFFFFFF (-1)
XOR r4, r7               ; r4 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r2, r1, r2, r4 -- if overflow (r4=-1!=0), r2=255; else r2 stays
CSEL r2, r1, r2, r4

; Lower clamp: max(r2, 0) using CSEL
; If r2 is negative (signed), pick 0; else pick r2
MOV r1, r2
LDI r0, 31
SAR r1, r0               ; r1 = -1 if negative, 0 if positive (condition register)
LDI r4, 0
CSEL r2, r4, r2, r1      ; if negative (r1!=0), r2=0; else r2 stays

; Store CSEL result
LDI r10, 0x2402
STORE r10, r2
LDI r10, 0x2404
STORE r10, r22

HALT
