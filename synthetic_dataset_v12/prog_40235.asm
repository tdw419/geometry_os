; DESCRIPTION: Renders a orange box of size 74x67 starting at (16, 124).
; PLAN: r0=16(x), r1=124(y), r2=74(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 124
LDI r2, 74
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
