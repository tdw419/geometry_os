; DESCRIPTION: Composite: Draws a orange line from (503, 84) to (489, 238) then Draws a green circle centered at (369, 137) with radius 45 then Sets a single green pixel at (504, 251).
; PLAN: r0=503(x1), r1=84(y1), r2=489(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=137(y), r7=45(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=504(x), r11=251(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 503
LDI r1, 84
LDI r2, 489
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 137
LDI r7, 45
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 504
LDI r11, 251
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
