; DESCRIPTION: Composite: Places a cyan dot at position (431, 31) then Renders a orange line between points (78, 7) and (307, 104) then Draws a orange circle centered at (428, 148) with radius 73.
; PLAN: r0=431(x), r1=31(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=78(x1), r6=7(y1), r7=307(x2), r8=104(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=428(x), r11=148(y), r12=73(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 431
LDI r1, 31
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 78
LDI r6, 7
LDI r7, 307
LDI r8, 104
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 148
LDI r12, 73
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
