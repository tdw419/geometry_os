; DESCRIPTION: Creates a green circular shape at (448, 162) with radius 57.
; PLAN: r0=448(x), r1=162(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 162
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
