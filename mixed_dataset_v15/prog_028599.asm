; DESCRIPTION: Composite: Renders a purple line between points (203, 106) and (318, 25) then Draws a cyan rectangle at (40, 42) with width 93 and height 35 then Creates a black circular shape at (61, 145) with radius 19.
; PLAN: r0=203(x1), r1=106(y1), r2=318(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=42(y), r7=93(width), r8=35(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=61(x), r11=145(y), r12=19(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 203
LDI r1, 106
LDI r2, 318
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 42
LDI r7, 93
LDI r8, 35
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 145
LDI r12, 19
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
