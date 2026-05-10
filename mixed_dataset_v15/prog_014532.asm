; DESCRIPTION: Composite: Sets a single orange pixel at (432, 126) then Renders a blue disk with center (409, 104) and radius 69.
; PLAN: r0=432(x), r1=126(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=104(y), r7=69(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 432
LDI r1, 126
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 409
LDI r6, 104
LDI r7, 69
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
