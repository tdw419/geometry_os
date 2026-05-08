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
LDI r14, 0x2400
STORE r14, r4         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r4 > 255, set r4 = 255
LDI r0, 255
CMP r4, r0
; CMP sets r9: -1 if r4<r0, 0 if equal, 1 if r4>r0
; We want to clamp only when r4 > 255 (r9 == 1)
; Trick: compare r9 with 1. If r9 < 1 (i.e. r9 == -1), skip.
LDI r7, 1
CMP r7, r9            ; compare 1 vs CMP result
BGE r9, branch_clamp_hi  ; if 1 >= r9 (always true since r9 is -1,0,or1)
; Wait, that always fires. Let me use a simpler approach:
; BLT r9 means r9 == -1, which means r4 < 255 -> skip
JMP branch_hi_check
branch_clamp_hi:
LDI r4, 255
branch_hi_check:

; Actually, simplest correct approach: check if r4 < 255, skip; else clamp
; Reset and redo cleanly
LDI r4, 300
LDI r20, 0

; Upper clamp using BLT: if r4 < 255, skip
LDI r0, 255
CMP r4, r0
BLT r9, branch_lo       ; r4 < 255, skip upper clamp
LDI r4, 255              ; r4 >= 255, clamp

branch_lo:
; Lower clamp: if r4 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r0, r4
LDI r7, 31
SAR r0, r7               ; r0 = all-ones if negative, all-zeros if positive
JZ r0, branch_done       ; if not negative, done
LDI r4, 0                ; clamp to 0

branch_done:
LDI r14, 0x2401
STORE r14, r4             ; save branch result
LDI r14, 0x2403
STORE r14, r20            ; save branch step count (0 = not instrumented precisely)

; ========================================
; Approach 2: CSEL-based clamp (branchless)
; ========================================
LDI r4, 300              ; reload test value
LDI r22, 0               ; step counter

; Upper clamp using CSEL: min(r4, 255)
; Strategy: compute a boolean mask, then CSEL
; CMP r4, 255 -> r9 = -1 (r4<255), 0 (equal), 1 (r4>255)
; We want: if r4 > 255, pick 255; else pick r4
; CSEL rd, rs_if_true, rs_if_false, cond
; So: CSEL r4, 255, r4, cond_for_overflow
; cond_for_overflow should be nonzero when r4 > 255
;
; Compute cond: CMP r4, 255 -> if r9 == 1, we have overflow
; Use: MOV cond, r9; LDI r7, 1; CMP cond, r7 -> BLT r9 means cond<1 i.e. cond=-1 (r4<255)
; We need the opposite: cond nonzero when r4>255
; Simple: after CMP, r9 is -1/0/1. r9 != -1 when r4 >= 255.
; BGE r9 fires when r9 != -1 (r4 >= 255). We can use that to set a flag.

LDI r0, 255
CMP r4, r0               ; r9 = -1 if r4<255, 0 if eq, 1 if r4>255

; Build condition register: nonzero when r4 > 255
; r9 == 1 means r4 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r9, r0 where r0=1. If r9 was 1, result=0. If r9 was -1, result=-2. If r9 was 0, result=-1.
; That doesn't help. Let me use: MOV r15, r9; LDI r1, 1; CMP r15, r1 -> BLT means r15<1 (r9=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r9 - 1)
; If r9=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r9=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r9=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r9, r4(where r4=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r15, 0
ADD r15, r9               ; r15 = CMP result (-1/0/1)
LDI r1, 1
SUB r15, r1               ; r15 = CMP_result - 1
LDI r11, 31
SAR r15, r11               ; r15 = 0 (overflow) or -1 (no overflow)
LDI r1, 0
SUB r1, r1               ; r1 = 0 (was: LDI can't do -1... use NEG)
LDI r1, 1
NEG r1                   ; r1 = 0xFFFFFFFF (-1)
XOR r15, r1               ; r15 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r4, r0, r4, r15 -- if overflow (r15=-1!=0), r4=255; else r4 stays
CSEL r4, r0, r4, r15

; Lower clamp: max(r4, 0) using CSEL
; If r4 is negative (signed), pick 0; else pick r4
MOV r0, r4
LDI r11, 31
SAR r0, r11               ; r0 = -1 if negative, 0 if positive (condition register)
LDI r15, 0
CSEL r4, r15, r4, r0      ; if negative (r0!=0), r4=0; else r4 stays

; Store CSEL result
LDI r14, 0x2402
STORE r14, r4
LDI r14, 0x2404
STORE r14, r22

HALT
