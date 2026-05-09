; DESCRIPTION: Creates a blue circular shape at (158, 185) with radius 51.
; PLAN: r0=158(x), r1=185(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 185
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
