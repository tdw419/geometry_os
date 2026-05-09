; DESCRIPTION: Renders a yellow box of size 81x100 starting at (133, 155).
; PLAN: r0=133(x), r1=155(y), r2=81(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 155
LDI r2, 81
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
