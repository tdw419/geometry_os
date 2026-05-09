; DESCRIPTION: Composite: Places a magenta dot at position (138, 227) then Creates a black circular shape at (310, 48) with radius 22.
; PLAN: r0=138(x), r1=227(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=48(y), r7=22(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 227
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 310
LDI r6, 48
LDI r7, 22
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
