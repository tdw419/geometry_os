; DESCRIPTION: Creates a black circular shape at (448, 188) with radius 25.
; PLAN: r0=448(x), r1=188(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 188
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
