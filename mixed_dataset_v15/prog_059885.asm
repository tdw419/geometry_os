; DESCRIPTION: Creates a green circular shape at (310, 118) with radius 44.
; PLAN: r0=310(x), r1=118(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 118
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
