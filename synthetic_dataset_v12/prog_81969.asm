; DESCRIPTION: Composite: Draws a orange circle centered at (364, 67) with radius 52 then Sets a single green pixel at (421, 73).
; PLAN: r0=364(x), r1=67(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x), r6=73(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 67
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 73
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
