; DESCRIPTION: Renders a black box of size 99x88 starting at (12, 4).
; PLAN: r0=12(x), r1=4(y), r2=99(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 4
LDI r2, 99
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
