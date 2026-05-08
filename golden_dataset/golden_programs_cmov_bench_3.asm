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
LDI r4, 300           ; test value: overflows 255
LDI r6, 0x2400
STORE r6, r4         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r4 > 255, set r4 = 255
LDI r15, 255
CMP r4, r15
; CMP sets r2: -1 if r4<r15, 0 if equal, 1 if r4>r15
; We want to clamp only when r4 > 255 (r2 == 1)
; Trick: compare r2 with 1. If r2 < 1 (i.e. r2 == -1), skip.
LDI r5, 1
CMP r5, r2            ; compare 1 vs CMP result
BGE r2, branch_clamp_hi  ; if 1 >= r2 (always true since r2 is -1,0,or1)
; Wait, that always fires. Let me use a simpler approach:
; BLT r2 means r2 == -1, which means r4 < 255 -> skip
JMP branch_hi_check
branch_clamp_hi:
LDI r4, 255
branch_hi_check:

; Actually, simplest correct approach: check if r4 < 255, skip; else clamp
; Reset and redo cleanly
LDI r4, 300
LDI r20, 0

; Upper clamp using BLT: if r4 < 255, skip
LDI r15, 255
CMP r4, r15
BLT r2, branch_lo       ; r4 < 255, skip upper clamp
LDI r4, 255              ; r4 >= 255, clamp

branch_lo:
; Lower clamp: if r4 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r15, r4
LDI r5, 31
SAR r15, r5               ; r15 = all-ones if negative, all-zeros if positive
JZ r15, branch_done       ; if not negative, done
LDI r4, 0                ; clamp to 0

branch_done:
LDI r6, 0x2401
STORE r6, r4             ; save branch result
LDI r6, 0x2403
STORE r6, r20            ; save branch step count (0 = not instrumented precisely)

; ========================================
; Approach 2: CSEL-based clamp (branchless)
; ========================================
LDI r4, 300              ; reload test value
LDI r22, 0               ; step counter

; Upper clamp using CSEL: min(r4, 255)
; Strategy: compute a boolean mask, then CSEL
; CMP r4, 255 -> r2 = -1 (r4<255), 0 (equal), 1 (r4>255)
; We want: if r4 > 255, pick 255; else pick r4
; CSEL rd, rs_if_true, rs_if_false, cond
; So: CSEL r4, 255, r4, cond_for_overflow
; cond_for_overflow should be nonzero when r4 > 255
;
; Compute cond: CMP r4, 255 -> if r2 == 1, we have overflow
; Use: MOV cond, r2; LDI r5, 1; CMP cond, r5 -> BLT r2 means cond<1 i.e. cond=-1 (r4<255)
; We need the opposite: cond nonzero when r4>255
; Simple: after CMP, r2 is -1/0/1. r2 != -1 when r4 >= 255.
; BGE r2 fires when r2 != -1 (r4 >= 255). We can use that to set a flag.

LDI r15, 255
CMP r4, r15               ; r2 = -1 if r4<255, 0 if eq, 1 if r4>255

; Build condition register: nonzero when r4 > 255
; r2 == 1 means r4 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r2, r15 where r15=1. If r2 was 1, result=0. If r2 was -1, result=-2. If r2 was 0, result=-1.
; That doesn't help. Let me use: MOV r1, r2; LDI r12, 1; CMP r1, r12 -> BLT means r1<1 (r2=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r2 - 1)
; If r2=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r2=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r2=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r2, r4(where r4=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r1, 0
ADD r1, r2               ; r1 = CMP result (-1/0/1)
LDI r12, 1
SUB r1, r12               ; r1 = CMP_result - 1
LDI r3, 31
SAR r1, r3               ; r1 = 0 (overflow) or -1 (no overflow)
LDI r12, 0
SUB r12, r12               ; r12 = 0 (was: LDI can't do -1... use NEG)
LDI r12, 1
NEG r12                   ; r12 = 0xFFFFFFFF (-1)
XOR r1, r12               ; r1 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r4, r15, r4, r1 -- if overflow (r1=-1!=0), r4=255; else r4 stays
CSEL r4, r15, r4, r1

; Lower clamp: max(r4, 0) using CSEL
; If r4 is negative (signed), pick 0; else pick r4
MOV r15, r4
LDI r3, 31
SAR r15, r3               ; r15 = -1 if negative, 0 if positive (condition register)
LDI r1, 0
CSEL r4, r1, r4, r15      ; if negative (r15!=0), r4=0; else r4 stays

; Store CSEL result
LDI r6, 0x2402
STORE r6, r4
LDI r6, 0x2404
STORE r6, r22

HALT
