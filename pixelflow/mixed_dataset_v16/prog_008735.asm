; DESCRIPTION: Places a green circle of radius 52 at center (448, 57).
; PLAN: r0=448(x), r1=57(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 57
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
