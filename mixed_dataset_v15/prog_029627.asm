; DESCRIPTION: Composite: Draws a purple circle centered at (102, 178) with radius 59 then Renders a green box of size 45x61 starting at (369, 72) then Places a purple line segment connecting (473, 118) to (115, 31).
; PLAN: r0=102(x), r1=178(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x), r6=72(y), r7=45(width), r8=61(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=473(x1), r11=118(y1), r12=115(x2), r13=31(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 178
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 72
LDI r7, 45
LDI r8, 61
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 473
LDI r11, 118
LDI r12, 115
LDI r13, 31
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
