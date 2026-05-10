; DESCRIPTION: Draws a blue circle centered at (463, 118) with radius 27.
; PLAN: r0=463(x), r1=118(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 118
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
