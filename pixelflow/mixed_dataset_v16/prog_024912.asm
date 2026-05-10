; DESCRIPTION: Composite: Creates a blue circular shape at (123, 113) with radius 59 then Places a white line segment connecting (157, 251) to (492, 13) then Creates a purple rectangular region at (45, 99) spanning 13 by 100 pixels.
; PLAN: r0=123(x), r1=113(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x1), r6=251(y1), r7=492(x2), r8=13(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=45(x), r11=99(y), r12=13(width), r13=100(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 113
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 251
LDI r7, 492
LDI r8, 13
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 99
LDI r12, 13
LDI r13, 100
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
