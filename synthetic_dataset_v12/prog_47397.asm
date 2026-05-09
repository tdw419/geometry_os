; DESCRIPTION: Composite: Places a purple circle of radius 58 at center (287, 198) then Creates a orange rectangular region at (440, 35) spanning 67 by 19 pixels then Places a magenta line segment connecting (355, 5) to (33, 247).
; PLAN: r0=287(x), r1=198(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=440(x), r6=35(y), r7=67(width), r8=19(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=355(x1), r11=5(y1), r12=33(x2), r13=247(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 198
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 440
LDI r6, 35
LDI r7, 67
LDI r8, 19
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 5
LDI r12, 33
LDI r13, 247
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
