; DESCRIPTION: Renders a blue box of size 15x101 starting at (140, 110).
; PLAN: r0=140(x), r1=110(y), r2=15(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 110
LDI r2, 15
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
