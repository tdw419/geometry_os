; DESCRIPTION: Composite: Places a black dot at position (81, 130) then Creates a yellow circular shape at (51, 148) with radius 38.
; PLAN: r0=81(x), r1=130(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=51(x), r6=148(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 81
LDI r1, 130
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 51
LDI r6, 148
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
