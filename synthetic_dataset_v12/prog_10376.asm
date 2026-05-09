; DESCRIPTION: Creates a blue circular shape at (286, 107) with radius 75.
; PLAN: r0=286(x), r1=107(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 107
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
