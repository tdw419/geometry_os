; DESCRIPTION: Creates a blue circular shape at (251, 140) with radius 58.
; PLAN: r0=251(x), r1=140(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 140
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
