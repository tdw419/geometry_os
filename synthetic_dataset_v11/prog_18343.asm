; DESCRIPTION: Renders a orange box of size 14x96 starting at (124, 67).
; PLAN: r0=124(x), r1=67(y), r2=14(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 67
LDI r2, 14
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
