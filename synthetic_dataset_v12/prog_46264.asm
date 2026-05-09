; DESCRIPTION: Composite: Places a blue line segment connecting (91, 0) to (28, 222) then Places a green circle of radius 59 at center (262, 194) then Creates a green rectangular region at (162, 162) spanning 38 by 11 pixels.
; PLAN: r0=91(x1), r1=0(y1), r2=28(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=194(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=162(x), r11=162(y), r12=38(width), r13=11(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 0
LDI r2, 28
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 194
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 162
LDI r11, 162
LDI r12, 38
LDI r13, 11
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
