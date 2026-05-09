; DESCRIPTION: Composite: Sets a single blue pixel at (15, 214) then Creates a white circular shape at (217, 171) with radius 22.
; PLAN: r0=15(x), r1=214(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=171(y), r7=22(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 15
LDI r1, 214
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 171
LDI r7, 22
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
