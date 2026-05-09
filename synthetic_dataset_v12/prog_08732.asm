; DESCRIPTION: Composite: Sets a single black pixel at (480, 235) then Creates a green circular shape at (441, 166) with radius 28.
; PLAN: r0=480(x), r1=235(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=441(x), r6=166(y), r7=28(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 480
LDI r1, 235
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 441
LDI r6, 166
LDI r7, 28
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
