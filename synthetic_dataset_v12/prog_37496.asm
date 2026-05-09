; DESCRIPTION: Composite: Places a blue dot at position (335, 115) then Creates a white circular shape at (252, 79) with radius 60.
; PLAN: r0=335(x), r1=115(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=79(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 335
LDI r1, 115
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 79
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
