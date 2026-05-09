; DESCRIPTION: Composite: Places a orange dot at position (159, 37) then Draws a cyan line from (21, 85) to (91, 45) then Creates a orange circular shape at (357, 148) with radius 75.
; PLAN: r0=159(x), r1=37(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=21(x1), r6=85(y1), r7=91(x2), r8=45(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=148(y), r12=75(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 159
LDI r1, 37
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 21
LDI r6, 85
LDI r7, 91
LDI r8, 45
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 148
LDI r12, 75
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
