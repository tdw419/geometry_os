; DESCRIPTION: Renders a black box of size 59x88 starting at (162, 96).
; PLAN: r0=162(x), r1=96(y), r2=59(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 96
LDI r2, 59
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
