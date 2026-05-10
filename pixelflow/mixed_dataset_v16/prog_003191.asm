; DESCRIPTION: Composite: Sets a single purple pixel at (29, 85) then Creates a orange circular shape at (206, 43) with radius 20.
; PLAN: r0=29(x), r1=85(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=206(x), r6=43(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 29
LDI r1, 85
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 206
LDI r6, 43
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
