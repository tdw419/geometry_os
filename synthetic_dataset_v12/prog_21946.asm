; DESCRIPTION: Composite: Sets a single orange pixel at (245, 69) then Creates a purple circular shape at (245, 92) with radius 67.
; PLAN: r0=245(x), r1=69(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=92(y), r7=67(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 245
LDI r1, 69
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 245
LDI r6, 92
LDI r7, 67
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
