; DESCRIPTION: Composite: Sets a single purple pixel at (219, 27) then Creates a purple circular shape at (195, 133) with radius 69.
; PLAN: r0=219(x), r1=27(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=133(y), r7=69(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 219
LDI r1, 27
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 195
LDI r6, 133
LDI r7, 69
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
