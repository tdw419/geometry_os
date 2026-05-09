; DESCRIPTION: Composite: Renders a green line between points (5, 51) and (318, 170) then Places a green circle of radius 38 at center (169, 144) then Creates a blue rectangular region at (164, 14) spanning 35 by 92 pixels.
; PLAN: r0=5(x1), r1=51(y1), r2=318(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=144(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=164(x), r11=14(y), r12=35(width), r13=92(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 51
LDI r2, 318
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 144
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 164
LDI r11, 14
LDI r12, 35
LDI r13, 92
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
