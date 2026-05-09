; DESCRIPTION: Renders a yellow box of size 84x118 starting at (55, 79).
; PLAN: r0=55(x), r1=79(y), r2=84(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 79
LDI r2, 84
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
