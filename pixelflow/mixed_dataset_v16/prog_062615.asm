; DESCRIPTION: Renders a black box of size 74x23 starting at (88, 212).
; PLAN: r0=88(x), r1=212(y), r2=74(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 212
LDI r2, 74
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
