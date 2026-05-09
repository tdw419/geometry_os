; DESCRIPTION: Renders a black box of size 88x105 starting at (25, 36).
; PLAN: r0=25(x), r1=36(y), r2=88(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 36
LDI r2, 88
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
