; DESCRIPTION: Composite: Renders a purple box of size 13x55 starting at (9, 151) then Renders a magenta line between points (447, 186) and (319, 113) then Creates a purple circular shape at (148, 223) with radius 26.
; PLAN: r0=9(x), r1=151(y), r2=13(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x1), r6=186(y1), r7=319(x2), r8=113(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=148(x), r11=223(y), r12=26(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 151
LDI r2, 13
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 186
LDI r7, 319
LDI r8, 113
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 223
LDI r12, 26
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
