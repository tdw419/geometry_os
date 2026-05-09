; DESCRIPTION: Composite: Places a orange dot at position (321, 67) then Creates a purple circular shape at (203, 68) with radius 61.
; PLAN: r0=321(x), r1=67(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=68(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 321
LDI r1, 67
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 203
LDI r6, 68
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
