; DESCRIPTION: Composite: Sets a single orange pixel at (165, 103) then Renders a white disk with center (217, 85) and radius 66.
; PLAN: r0=165(x), r1=103(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=85(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 165
LDI r1, 103
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 217
LDI r6, 85
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
