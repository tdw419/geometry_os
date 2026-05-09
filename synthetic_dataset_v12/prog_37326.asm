; DESCRIPTION: Composite: Draws a yellow line from (359, 219) to (245, 56) then Creates a purple rectangular region at (9, 17) spanning 97 by 77 pixels then Sets a single yellow pixel at (351, 65).
; PLAN: r0=359(x1), r1=219(y1), r2=245(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=17(y), r7=97(width), r8=77(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=351(x), r11=65(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 359
LDI r1, 219
LDI r2, 245
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 17
LDI r7, 97
LDI r8, 77
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 65
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
