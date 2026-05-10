; DESCRIPTION: Creates a blue circular shape at (367, 89) with radius 40.
; PLAN: r0=367(x), r1=89(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 89
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
