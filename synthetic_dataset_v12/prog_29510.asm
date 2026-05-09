; DESCRIPTION: Composite: Renders a orange line between points (289, 156) and (280, 205) then Renders a purple disk with center (272, 116) and radius 67 then Sets a single green pixel at (490, 235).
; PLAN: r0=289(x1), r1=156(y1), r2=280(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=116(y), r7=67(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=490(x), r11=235(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 156
LDI r2, 280
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 116
LDI r7, 67
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 490
LDI r11, 235
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
