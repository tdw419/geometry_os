; DESCRIPTION: Composite: Places a orange dot at position (441, 148) then Creates a green circular shape at (92, 116) with radius 13.
; PLAN: r0=441(x), r1=148(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=116(y), r7=13(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 441
LDI r1, 148
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 92
LDI r6, 116
LDI r7, 13
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
