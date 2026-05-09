; DESCRIPTION: Renders a blue box of size 81x51 starting at (110, 81).
; PLAN: r0=110(x), r1=81(y), r2=81(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 81
LDI r2, 81
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
