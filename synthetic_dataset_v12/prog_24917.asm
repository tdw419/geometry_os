; DESCRIPTION: Composite: Renders a cyan disk with center (407, 117) and radius 26 then Renders a orange line between points (272, 109) and (97, 174) then Sets a single blue pixel at (276, 19).
; PLAN: r0=407(x), r1=117(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x1), r6=109(y1), r7=97(x2), r8=174(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=276(x), r11=19(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 407
LDI r1, 117
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 109
LDI r7, 97
LDI r8, 174
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 19
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
