; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
LDI r14, 300           ; test value: overflows 255
LDI r7, 0x2400
STORE r7, r14         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r14 > 255, set r14 = 255
LDI r5, 255
CMP r14, r5
; CMP sets r12: -1 if r14<r5, 0 if equal, 1 if r14>r5
; We want to clamp only when r14 > 255 (r12 == 1)
; Trick: compare r12 with 1. If r12 < 1 (i.e. r12 == -1), skip.
LDI r10, 1
CMP r10, r12            ; compare 1 vs CMP result
BGE r12, branch_clamp_hi  ; if 1 >= r12 (always true since r12 is -1,0,or1)
; Wait, that always fires. Let me use a simpler approach:
; BLT r12 means r12 == -1, which means r14 < 255 -> skip
JMP branch_hi_check
branch_clamp_hi:
LDI r14, 255
branch_hi_check:

; Actually, simplest correct approach: check if r14 < 255, skip; else clamp
; Reset and redo cleanly
LDI r14, 300
LDI r20, 0

; Upper clamp using BLT: if r14 < 255, skip
LDI r5, 255
CMP r14, r5
BLT r12, branch_lo       ; r14 < 255, skip upper clamp
LDI r14, 255              ; r14 >= 255, clamp

branch_lo:
; Lower clamp: if r14 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r5, r14
LDI r10, 31
SAR r5, r10               ; r5 = all-ones if negative, all-zeros if positive
JZ r5, branch_done       ; if not negative, done
LDI r14, 0                ; clamp to 0

branch_done:
LDI r7, 0x2401
STORE r7, r14             ; save branch result
LDI r7, 0x2403
STORE r7, r20            ; save branch step count (0 = not instrumented precisely)

; ========================================
; Approach 2: CSEL-based clamp (branchless)
; ========================================
LDI r14, 300              ; reload test value
LDI r22, 0               ; step counter

; Upper clamp using CSEL: min(r14, 255)
; Strategy: compute a boolean mask, then CSEL
; CMP r14, 255 -> r12 = -1 (r14<255), 0 (equal), 1 (r14>255)
; We want: if r14 > 255, pick 255; else pick r14
; CSEL rd, rs_if_true, rs_if_false, cond
; So: CSEL r14, 255, r14, cond_for_overflow
; cond_for_overflow should be nonzero when r14 > 255
;
; Compute cond: CMP r14, 255 -> if r12 == 1, we have overflow
; Use: MOV cond, r12; LDI r10, 1; CMP cond, r10 -> BLT r12 means cond<1 i.e. cond=-1 (r14<255)
; We need the opposite: cond nonzero when r14>255
; Simple: after CMP, r12 is -1/0/1. r12 != -1 when r14 >= 255.
; BGE r12 fires when r12 != -1 (r14 >= 255). We can use that to set a flag.

LDI r5, 255
CMP r14, r5               ; r12 = -1 if r14<255, 0 if eq, 1 if r14>255

; Build condition register: nonzero when r14 > 255
; r12 == 1 means r14 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r12, r5 where r5=1. If r12 was 1, result=0. If r12 was -1, result=-2. If r12 was 0, result=-1.
; That doesn't help. Let me use: MOV r11, r12; LDI r2, 1; CMP r11, r2 -> BLT means r11<1 (r12=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r12 - 1)
; If r12=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r12=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r12=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r12, r14(where r14=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r11, 0
ADD r11, r12               ; r11 = CMP result (-1/0/1)
LDI r2, 1
SUB r11, r2               ; r11 = CMP_result - 1
LDI r13, 31
SAR r11, r13               ; r11 = 0 (overflow) or -1 (no overflow)
LDI r2, 0
SUB r2, r2               ; r2 = 0 (was: LDI can't do -1... use NEG)
LDI r2, 1
NEG r2                   ; r2 = 0xFFFFFFFF (-1)
XOR r11, r2               ; r11 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r14, r5, r14, r11 -- if overflow (r11=-1!=0), r14=255; else r14 stays
CSEL r14, r5, r14, r11

; Lower clamp: max(r14, 0) using CSEL
; If r14 is negative (signed), pick 0; else pick r14
MOV r5, r14
LDI r13, 31
SAR r5, r13               ; r5 = -1 if negative, 0 if positive (condition register)
LDI r11, 0
CSEL r14, r11, r14, r5      ; if negative (r5!=0), r14=0; else r14 stays

; Store CSEL result
LDI r7, 0x2402
STORE r7, r14
LDI r7, 0x2404
STORE r7, r22

HALT
