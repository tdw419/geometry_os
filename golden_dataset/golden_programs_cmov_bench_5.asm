; DESCRIPTION: Geometry OS program to draw a colored object.

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
LDI r12, 0x2400
STORE r12, r4         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r4 > 255, set r4 = 255
LDI r13, 255
CMP r4, r13
; CMP sets r2: -1 if r4<r13, 0 if equal, 1 if r4>r13
; We want to clamp only when r4 > 255 (r2 == 1)
; Trick: compare r2 with 1. If r2 < 1 (i.e. r2 == -1), skip.
LDI r3, 1
CMP r3, r2            ; compare 1 vs CMP result
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
LDI r13, 255
CMP r4, r13
BLT r2, branch_lo       ; r4 < 255, skip upper clamp
LDI r4, 255              ; r4 >= 255, clamp

branch_lo:
; Lower clamp: if r4 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r13, r4
LDI r3, 31
SAR r13, r3               ; r13 = all-ones if negative, all-zeros if positive
JZ r13, branch_done       ; if not negative, done
LDI r4, 0                ; clamp to 0

branch_done:
LDI r12, 0x2401
STORE r12, r4             ; save branch result
LDI r12, 0x2403
STORE r12, r20            ; save branch step count (0 = not instrumented precisely)

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
; Use: MOV cond, r2; LDI r3, 1; CMP cond, r3 -> BLT r2 means cond<1 i.e. cond=-1 (r4<255)
; We need the opposite: cond nonzero when r4>255
; Simple: after CMP, r2 is -1/0/1. r2 != -1 when r4 >= 255.
; BGE r2 fires when r2 != -1 (r4 >= 255). We can use that to set a flag.

LDI r13, 255
CMP r4, r13               ; r2 = -1 if r4<255, 0 if eq, 1 if r4>255

; Build condition register: nonzero when r4 > 255
; r2 == 1 means r4 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r2, r13 where r13=1. If r2 was 1, result=0. If r2 was -1, result=-2. If r2 was 0, result=-1.
; That doesn't help. Let me use: MOV r10, r2; LDI r11, 1; CMP r10, r11 -> BLT means r10<1 (r2=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r2 - 1)
; If r2=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r2=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r2=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r2, r4(where r4=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r10, 0
ADD r10, r2               ; r10 = CMP result (-1/0/1)
LDI r11, 1
SUB r10, r11               ; r10 = CMP_result - 1
LDI r15, 31
SAR r10, r15               ; r10 = 0 (overflow) or -1 (no overflow)
LDI r11, 0
SUB r11, r11               ; r11 = 0 (was: LDI can't do -1... use NEG)
LDI r11, 1
NEG r11                   ; r11 = 0xFFFFFFFF (-1)
XOR r10, r11               ; r10 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r4, r13, r4, r10 -- if overflow (r10=-1!=0), r4=255; else r4 stays
CSEL r4, r13, r4, r10

; Lower clamp: max(r4, 0) using CSEL
; If r4 is negative (signed), pick 0; else pick r4
MOV r13, r4
LDI r15, 31
SAR r13, r15               ; r13 = -1 if negative, 0 if positive (condition register)
LDI r10, 0
CSEL r4, r10, r4, r13      ; if negative (r13!=0), r4=0; else r4 stays

; Store CSEL result
LDI r12, 0x2402
STORE r12, r4
LDI r12, 0x2404
STORE r12, r22

HALT
