; DESCRIPTION: Composite: Renders a yellow box of size 44x59 starting at (329, 6) then Creates a purple circular shape at (70, 104) with radius 58 then Renders a blue line between points (40, 222) and (44, 58).
; PLAN: r0=329(x), r1=6(y), r2=44(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x), r6=104(y), r7=58(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x1), r11=222(y1), r12=44(x2), r13=58(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 6
LDI r2, 44
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 104
LDI r7, 58
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 222
LDI r12, 44
LDI r13, 58
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
