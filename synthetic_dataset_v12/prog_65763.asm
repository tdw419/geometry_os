; DESCRIPTION: Composite: Renders a black line between points (21, 180) and (68, 70) then Places a green 81x106 rectangle at position (9, 83) then Creates a blue circular shape at (301, 172) with radius 70.
; PLAN: r0=21(x1), r1=180(y1), r2=68(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=83(y), r7=81(width), r8=106(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=301(x), r11=172(y), r12=70(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 21
LDI r1, 180
LDI r2, 68
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 83
LDI r7, 81
LDI r8, 106
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 172
LDI r12, 70
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
