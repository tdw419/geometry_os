; DESCRIPTION: Composite: Places a orange dot at position (314, 134) then Places a purple circle of radius 49 at center (364, 135).
; PLAN: r0=314(x), r1=134(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=135(y), r7=49(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 314
LDI r1, 134
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 364
LDI r6, 135
LDI r7, 49
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
