; DESCRIPTION: Creates a blue circular shape at (75, 87) with radius 36.
; PLAN: r0=75(x), r1=87(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 87
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
