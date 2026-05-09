; DESCRIPTION: Creates a blue circular shape at (51, 50) with radius 23.
; PLAN: r0=51(x), r1=50(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 50
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
