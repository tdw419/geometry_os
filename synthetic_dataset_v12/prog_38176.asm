; DESCRIPTION: Composite: Renders a white disk with center (145, 80) and radius 27 then Creates a orange rectangular region at (378, 38) spanning 94 by 108 pixels then Sets a single white pixel at (322, 11).
; PLAN: r0=145(x), r1=80(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x), r6=38(y), r7=94(width), r8=108(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=322(x), r11=11(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 145
LDI r1, 80
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 38
LDI r7, 94
LDI r8, 108
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 322
LDI r11, 11
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
