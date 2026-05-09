; DESCRIPTION: Renders a yellow box of size 84x34 starting at (2, 88).
; PLAN: r0=2(x), r1=88(y), r2=84(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 88
LDI r2, 84
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
