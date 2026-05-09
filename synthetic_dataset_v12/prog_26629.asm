; DESCRIPTION: Composite: Sets a single white pixel at (447, 105) then Renders a purple box of size 45x108 starting at (428, 99) then Renders a purple line between points (162, 219) and (63, 155).
; PLAN: r0=447(x), r1=105(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=428(x), r6=99(y), r7=45(width), r8=108(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x1), r11=219(y1), r12=63(x2), r13=155(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 447
LDI r1, 105
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 428
LDI r6, 99
LDI r7, 45
LDI r8, 108
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 219
LDI r12, 63
LDI r13, 155
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
