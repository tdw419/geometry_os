; DESCRIPTION: Renders a yellow box of size 84x95 starting at (219, 88).
; PLAN: r0=219(x), r1=88(y), r2=84(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 88
LDI r2, 84
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
