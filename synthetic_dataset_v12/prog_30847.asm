; DESCRIPTION: Composite: Creates a orange rectangular region at (355, 59) spanning 66 by 26 pixels then Draws a magenta line from (274, 125) to (282, 105) then Creates a cyan circular shape at (471, 62) with radius 14.
; PLAN: r0=355(x), r1=59(y), r2=66(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x1), r6=125(y1), r7=282(x2), r8=105(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=471(x), r11=62(y), r12=14(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 355
LDI r1, 59
LDI r2, 66
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 125
LDI r7, 282
LDI r8, 105
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 62
LDI r12, 14
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
