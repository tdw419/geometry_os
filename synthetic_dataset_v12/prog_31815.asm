; DESCRIPTION: Composite: Renders a yellow line between points (248, 217) and (43, 136) then Creates a green rectangular region at (219, 90) spanning 91 by 110 pixels.
; PLAN: r0=248(x1), r1=217(y1), r2=43(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=90(y), r7=91(width), r8=110(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 248
LDI r1, 217
LDI r2, 43
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 90
LDI r7, 91
LDI r8, 110
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
