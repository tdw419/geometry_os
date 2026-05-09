; DESCRIPTION: Composite: Draws a orange rectangle at (228, 118) with width 106 and height 44 then Renders a orange line between points (345, 2) and (318, 108) then Creates a purple circular shape at (68, 176) with radius 45.
; PLAN: r0=228(x), r1=118(y), r2=106(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x1), r6=2(y1), r7=318(x2), r8=108(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=68(x), r11=176(y), r12=45(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 228
LDI r1, 118
LDI r2, 106
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 2
LDI r7, 318
LDI r8, 108
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 176
LDI r12, 45
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
