; DESCRIPTION: Composite: Places a cyan circle of radius 60 at center (290, 113) then Creates a cyan rectangular region at (484, 110) spanning 12 by 33 pixels then Renders a yellow line between points (309, 252) and (505, 147).
; PLAN: r0=290(x), r1=113(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x), r6=110(y), r7=12(width), r8=33(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=309(x1), r11=252(y1), r12=505(x2), r13=147(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 113
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 110
LDI r7, 12
LDI r8, 33
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 252
LDI r12, 505
LDI r13, 147
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
