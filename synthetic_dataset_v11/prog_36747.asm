; DESCRIPTION: Renders a yellow box of size 20x51 starting at (132, 185).
; PLAN: r0=132(x), r1=185(y), r2=20(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 185
LDI r2, 20
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
