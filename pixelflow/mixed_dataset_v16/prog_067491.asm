; DESCRIPTION: Renders a blue box of size 36x51 starting at (9, 185).
; PLAN: r0=9(x), r1=185(y), r2=36(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 185
LDI r2, 36
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
