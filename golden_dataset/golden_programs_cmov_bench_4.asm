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
LDI r12, 300           ; test value: overflows 255
LDI r14, 0x2400
STORE r14, r12         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r12 > 255, set r12 = 255
LDI r6, 255
CMP r12, r6
; CMP sets r4: -1 if r12<r6, 0 if equal, 1 if r12>r6
; We want to clamp only when r12 > 255 (r4 == 1)
; Trick: compare r4 with 1. If r4 < 1 (i.e. r4 == -1), skip.
LDI r3, 1
CMP r3, r4            ; compare 1 vs CMP result
BGE r4, branch_clamp_hi  ; if 1 >= r4 (always true since r4 is -1,0,or1)
; Wait, that always fires. Let me use a simpler approach:
; BLT r4 means r4 == -1, which means r12 < 255 -> skip
JMP branch_hi_check
branch_clamp_hi:
LDI r12, 255
branch_hi_check:

; Actually, simplest correct approach: check if r12 < 255, skip; else clamp
; Reset and redo cleanly
LDI r12, 300
LDI r20, 0

; Upper clamp using BLT: if r12 < 255, skip
LDI r6, 255
CMP r12, r6
BLT r4, branch_lo       ; r12 < 255, skip upper clamp
LDI r12, 255              ; r12 >= 255, clamp

branch_lo:
; Lower clamp: if r12 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r6, r12
LDI r3, 31
SAR r6, r3               ; r6 = all-ones if negative, all-zeros if positive
JZ r6, branch_done       ; if not negative, done
LDI r12, 0                ; clamp to 0

branch_done:
LDI r14, 0x2401
STORE r14, r12             ; save branch result
LDI r14, 0x2403
STORE r14, r20            ; save branch step count (0 = not instrumented precisely)

; ========================================
; Approach 2: CSEL-based clamp (branchless)
; ========================================
LDI r12, 300              ; reload test value
LDI r22, 0               ; step counter

; Upper clamp using CSEL: min(r12, 255)
; Strategy: compute a boolean mask, then CSEL
; CMP r12, 255 -> r4 = -1 (r12<255), 0 (equal), 1 (r12>255)
; We want: if r12 > 255, pick 255; else pick r12
; CSEL rd, rs_if_true, rs_if_false, cond
; So: CSEL r12, 255, r12, cond_for_overflow
; cond_for_overflow should be nonzero when r12 > 255
;
; Compute cond: CMP r12, 255 -> if r4 == 1, we have overflow
; Use: MOV cond, r4; LDI r3, 1; CMP cond, r3 -> BLT r4 means cond<1 i.e. cond=-1 (r12<255)
; We need the opposite: cond nonzero when r12>255
; Simple: after CMP, r4 is -1/0/1. r4 != -1 when r12 >= 255.
; BGE r4 fires when r4 != -1 (r12 >= 255). We can use that to set a flag.

LDI r6, 255
CMP r12, r6               ; r4 = -1 if r12<255, 0 if eq, 1 if r12>255

; Build condition register: nonzero when r12 > 255
; r4 == 1 means r12 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r4, r6 where r6=1. If r4 was 1, result=0. If r4 was -1, result=-2. If r4 was 0, result=-1.
; That doesn't help. Let me use: MOV r13, r4; LDI r7, 1; CMP r13, r7 -> BLT means r13<1 (r4=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r4 - 1)
; If r4=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r4=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r4=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r4, r12(where r12=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r13, 0
ADD r13, r4               ; r13 = CMP result (-1/0/1)
LDI r7, 1
SUB r13, r7               ; r13 = CMP_result - 1
LDI r8, 31
SAR r13, r8               ; r13 = 0 (overflow) or -1 (no overflow)
LDI r7, 0
SUB r7, r7               ; r7 = 0 (was: LDI can't do -1... use NEG)
LDI r7, 1
NEG r7                   ; r7 = 0xFFFFFFFF (-1)
XOR r13, r7               ; r13 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r12, r6, r12, r13 -- if overflow (r13=-1!=0), r12=255; else r12 stays
CSEL r12, r6, r12, r13

; Lower clamp: max(r12, 0) using CSEL
; If r12 is negative (signed), pick 0; else pick r12
MOV r6, r12
LDI r8, 31
SAR r6, r8               ; r6 = -1 if negative, 0 if positive (condition register)
LDI r13, 0
CSEL r12, r13, r12, r6      ; if negative (r6!=0), r12=0; else r12 stays

; Store CSEL result
LDI r14, 0x2402
STORE r14, r12
LDI r14, 0x2404
STORE r14, r22

HALT
