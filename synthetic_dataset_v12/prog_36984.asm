; DESCRIPTION: Composite: Renders a orange line between points (211, 40) and (49, 21) then Creates a white rectangular region at (302, 97) spanning 13 by 37 pixels then Draws a cyan circle centered at (77, 228) with radius 18.
; PLAN: r0=211(x1), r1=40(y1), r2=49(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=97(y), r7=13(width), r8=37(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=77(x), r11=228(y), r12=18(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 211
LDI r1, 40
LDI r2, 49
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 97
LDI r7, 13
LDI r8, 37
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 228
LDI r12, 18
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
