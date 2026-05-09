; DESCRIPTION: Composite: Draws a white rectangle at (414, 177) with width 18 and height 33 then Draws a orange line from (451, 91) to (378, 44) then Places a red dot at position (226, 5).
; PLAN: r0=414(x), r1=177(y), r2=18(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=451(x1), r6=91(y1), r7=378(x2), r8=44(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=226(x), r11=5(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 414
LDI r1, 177
LDI r2, 18
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 91
LDI r7, 378
LDI r8, 44
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 5
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
