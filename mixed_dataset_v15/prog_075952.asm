; DESCRIPTION: Composite: Draws a white line from (91, 114) to (472, 159) then Sets a single cyan pixel at (226, 183) then Draws a orange circle centered at (428, 82) with radius 76.
; PLAN: r0=91(x1), r1=114(y1), r2=472(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=183(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=428(x), r11=82(y), r12=76(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 91
LDI r1, 114
LDI r2, 472
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 183
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 428
LDI r11, 82
LDI r12, 76
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
