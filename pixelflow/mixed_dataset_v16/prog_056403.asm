; DESCRIPTION: Composite: Places a purple dot at position (136, 218) then Draws a orange circle centered at (353, 87) with radius 46.
; PLAN: r0=136(x), r1=218(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=353(x), r6=87(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 136
LDI r1, 218
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 353
LDI r6, 87
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
