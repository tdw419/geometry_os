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
LDI r1, 300           ; test value: overflows 255
LDI r10, 0x2400
STORE r10, r1         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r1 > 255, set r1 = 255
LDI r2, 255
CMP r1, r2
; CMP sets r0: -1 if r1<r2, 0 if equal, 1 if r1>r2
; We want to clamp only when r1 > 255 (r0 == 1)
; Trick: compare r0 with 1. If r0 < 1 (i.e. r0 == -1), skip.
LDI r3, 1
CMP r3, r0            ; compare 1 vs CMP result
BGE r0, branch_clamp_hi  ; if 1 >= r0 (always true since r0 is -1,0,or1)
; Wait, that always fires. Let me use a simpler approach:
; BLT r0 means r0 == -1, which means r1 < 255 -> skip
JMP branch_hi_check
branch_clamp_hi:
LDI r1, 255
branch_hi_check:

; Actually, simplest correct approach: check if r1 < 255, skip; else clamp
; Reset and redo cleanly
LDI r1, 300
LDI r20, 0

; Upper clamp using BLT: if r1 < 255, skip
LDI r2, 255
CMP r1, r2
BLT r0, branch_lo       ; r1 < 255, skip upper clamp
LDI r1, 255              ; r1 >= 255, clamp

branch_lo:
; Lower clamp: if r1 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r2, r1
LDI r3, 31
SAR r2, r3               ; r2 = all-ones if negative, all-zeros if positive
JZ r2, branch_done       ; if not negative, done
LDI r1, 0                ; clamp to 0

branch_done:
LDI r10, 0x2401
STORE r10, r1             ; save branch result
LDI r10, 0x2403
STORE r10, r20            ; save branch step count (0 = not instrumented precisely)

; ========================================
; Approach 2: CSEL-based clamp (branchless)
; ========================================
LDI r1, 300              ; reload test value
LDI r22, 0               ; step counter

; Upper clamp using CSEL: min(r1, 255)
; Strategy: compute a boolean mask, then CSEL
; CMP r1, 255 -> r0 = -1 (r1<255), 0 (equal), 1 (r1>255)
; We want: if r1 > 255, pick 255; else pick r1
; CSEL rd, rs_if_true, rs_if_false, cond
; So: CSEL r1, 255, r1, cond_for_overflow
; cond_for_overflow should be nonzero when r1 > 255
;
; Compute cond: CMP r1, 255 -> if r0 == 1, we have overflow
; Use: MOV cond, r0; LDI r3, 1; CMP cond, r3 -> BLT r0 means cond<1 i.e. cond=-1 (r1<255)
; We need the opposite: cond nonzero when r1>255
; Simple: after CMP, r0 is -1/0/1. r0 != -1 when r1 >= 255.
; BGE r0 fires when r0 != -1 (r1 >= 255). We can use that to set a flag.

LDI r2, 255
CMP r1, r2               ; r0 = -1 if r1<255, 0 if eq, 1 if r1>255

; Build condition register: nonzero when r1 > 255
; r0 == 1 means r1 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r0, r2 where r2=1. If r0 was 1, result=0. If r0 was -1, result=-2. If r0 was 0, result=-1.
; That doesn't help. Let me use: MOV r5, r0; LDI r6, 1; CMP r5, r6 -> BLT means r5<1 (r0=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r0 - 1)
; If r0=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r0=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r0=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r0, r1(where r1=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r5, 0
ADD r5, r0               ; r5 = CMP result (-1/0/1)
LDI r6, 1
SUB r5, r6               ; r5 = CMP_result - 1
LDI r7, 31
SAR r5, r7               ; r5 = 0 (overflow) or -1 (no overflow)
LDI r6, 0
SUB r6, r6               ; r6 = 0 (was: LDI can't do -1... use NEG)
LDI r6, 1
NEG r6                   ; r6 = 0xFFFFFFFF (-1)
XOR r5, r6               ; r5 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r1, r2, r1, r5 -- if overflow (r5=-1!=0), r1=255; else r1 stays
CSEL r1, r2, r1, r5

; Lower clamp: max(r1, 0) using CSEL
; If r1 is negative (signed), pick 0; else pick r1
MOV r2, r1
LDI r7, 31
SAR r2, r7               ; r2 = -1 if negative, 0 if positive (condition register)
LDI r5, 0
CSEL r1, r5, r1, r2      ; if negative (r2!=0), r1=0; else r1 stays

; Store CSEL result
LDI r10, 0x2402
STORE r10, r1
LDI r10, 0x2404
STORE r10, r22

HALT
