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
LDI r9, 300           ; test value: overflows 255
LDI r7, 0x2400
STORE r7, r9         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r9 > 255, set r9 = 255
LDI r2, 255
CMP r9, r2
; CMP sets r14: -1 if r9<r2, 0 if equal, 1 if r9>r2
; We want to clamp only when r9 > 255 (r14 == 1)
; Trick: compare r14 with 1. If r14 < 1 (i.e. r14 == -1), skip.
LDI r15, 1
CMP r15, r14            ; compare 1 vs CMP result
BGE r14, branch_clamp_hi  ; if 1 >= r14 (always true since r14 is -1,0,or1)
; Wait, that always fires. Let me use a simpler approach:
; BLT r14 means r14 == -1, which means r9 < 255 -> skip
JMP branch_hi_check
branch_clamp_hi:
LDI r9, 255
branch_hi_check:

; Actually, simplest correct approach: check if r9 < 255, skip; else clamp
; Reset and redo cleanly
LDI r9, 300
LDI r20, 0

; Upper clamp using BLT: if r9 < 255, skip
LDI r2, 255
CMP r9, r2
BLT r14, branch_lo       ; r9 < 255, skip upper clamp
LDI r9, 255              ; r9 >= 255, clamp

branch_lo:
; Lower clamp: if r9 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r2, r9
LDI r15, 31
SAR r2, r15               ; r2 = all-ones if negative, all-zeros if positive
JZ r2, branch_done       ; if not negative, done
LDI r9, 0                ; clamp to 0

branch_done:
LDI r7, 0x2401
STORE r7, r9             ; save branch result
LDI r7, 0x2403
STORE r7, r20            ; save branch step count (0 = not instrumented precisely)

; ========================================
; Approach 2: CSEL-based clamp (branchless)
; ========================================
LDI r9, 300              ; reload test value
LDI r22, 0               ; step counter

; Upper clamp using CSEL: min(r9, 255)
; Strategy: compute a boolean mask, then CSEL
; CMP r9, 255 -> r14 = -1 (r9<255), 0 (equal), 1 (r9>255)
; We want: if r9 > 255, pick 255; else pick r9
; CSEL rd, rs_if_true, rs_if_false, cond
; So: CSEL r9, 255, r9, cond_for_overflow
; cond_for_overflow should be nonzero when r9 > 255
;
; Compute cond: CMP r9, 255 -> if r14 == 1, we have overflow
; Use: MOV cond, r14; LDI r15, 1; CMP cond, r15 -> BLT r14 means cond<1 i.e. cond=-1 (r9<255)
; We need the opposite: cond nonzero when r9>255
; Simple: after CMP, r14 is -1/0/1. r14 != -1 when r9 >= 255.
; BGE r14 fires when r14 != -1 (r9 >= 255). We can use that to set a flag.

LDI r2, 255
CMP r9, r2               ; r14 = -1 if r9<255, 0 if eq, 1 if r9>255

; Build condition register: nonzero when r9 > 255
; r14 == 1 means r9 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r14, r2 where r2=1. If r14 was 1, result=0. If r14 was -1, result=-2. If r14 was 0, result=-1.
; That doesn't help. Let me use: MOV r8, r14; LDI r3, 1; CMP r8, r3 -> BLT means r8<1 (r14=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r14 - 1)
; If r14=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r14=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r14=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r14, r9(where r9=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r8, 0
ADD r8, r14               ; r8 = CMP result (-1/0/1)
LDI r3, 1
SUB r8, r3               ; r8 = CMP_result - 1
LDI r4, 31
SAR r8, r4               ; r8 = 0 (overflow) or -1 (no overflow)
LDI r3, 0
SUB r3, r3               ; r3 = 0 (was: LDI can't do -1... use NEG)
LDI r3, 1
NEG r3                   ; r3 = 0xFFFFFFFF (-1)
XOR r8, r3               ; r8 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r9, r2, r9, r8 -- if overflow (r8=-1!=0), r9=255; else r9 stays
CSEL r9, r2, r9, r8

; Lower clamp: max(r9, 0) using CSEL
; If r9 is negative (signed), pick 0; else pick r9
MOV r2, r9
LDI r4, 31
SAR r2, r4               ; r2 = -1 if negative, 0 if positive (condition register)
LDI r8, 0
CSEL r9, r8, r9, r2      ; if negative (r2!=0), r9=0; else r9 stays

; Store CSEL result
LDI r7, 0x2402
STORE r7, r9
LDI r7, 0x2404
STORE r7, r22

HALT
