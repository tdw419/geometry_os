; DESCRIPTION: Composite: Places a yellow dot at position (34, 245) then Creates a green circular shape at (56, 142) with radius 21.
; PLAN: r0=34(x), r1=245(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=56(x), r6=142(y), r7=21(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 34
LDI r1, 245
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 56
LDI r6, 142
LDI r7, 21
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
