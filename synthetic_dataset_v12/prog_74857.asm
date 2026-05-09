; DESCRIPTION: Composite: Sets a single purple pixel at (351, 79) then Renders a blue disk with center (165, 186) and radius 61.
; PLAN: r0=351(x), r1=79(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=186(y), r7=61(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 351
LDI r1, 79
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 165
LDI r6, 186
LDI r7, 61
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
