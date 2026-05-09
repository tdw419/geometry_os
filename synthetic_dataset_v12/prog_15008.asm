; DESCRIPTION: Composite: Places a yellow dot at position (150, 26) then Draws a orange line from (124, 7) to (500, 95) then Creates a orange circular shape at (318, 57) with radius 33.
; PLAN: r0=150(x), r1=26(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=124(x1), r6=7(y1), r7=500(x2), r8=95(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=318(x), r11=57(y), r12=33(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 150
LDI r1, 26
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 124
LDI r6, 7
LDI r7, 500
LDI r8, 95
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 318
LDI r11, 57
LDI r12, 33
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
