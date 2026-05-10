; DESCRIPTION: Composite: Sets a single orange pixel at (458, 138) then Creates a blue circular shape at (122, 166) with radius 53.
; PLAN: r0=458(x), r1=138(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=166(y), r7=53(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 458
LDI r1, 138
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 122
LDI r6, 166
LDI r7, 53
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
