; DESCRIPTION: Composite: Sets a single black pixel at (200, 227) then Places a yellow line segment connecting (19, 216) to (319, 186) then Creates a purple rectangular region at (229, 105) spanning 87 by 40 pixels.
; PLAN: r0=200(x), r1=227(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=19(x1), r6=216(y1), r7=319(x2), r8=186(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=229(x), r11=105(y), r12=87(width), r13=40(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 200
LDI r1, 227
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 19
LDI r6, 216
LDI r7, 319
LDI r8, 186
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 105
LDI r12, 87
LDI r13, 40
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
