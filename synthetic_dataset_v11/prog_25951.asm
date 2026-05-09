; DESCRIPTION: Renders a purple box of size 99x51 starting at (137, 90).
; PLAN: r0=137(x), r1=90(y), r2=99(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 90
LDI r2, 99
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
