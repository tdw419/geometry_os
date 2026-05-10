; DESCRIPTION: Composite: Places a magenta line segment connecting (438, 219) to (337, 20) then Creates a white rectangular region at (310, 104) spanning 12 by 114 pixels then Creates a purple circular shape at (61, 172) with radius 48.
; PLAN: r0=438(x1), r1=219(y1), r2=337(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=104(y), r7=12(width), r8=114(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=61(x), r11=172(y), r12=48(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 438
LDI r1, 219
LDI r2, 337
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 104
LDI r7, 12
LDI r8, 114
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 172
LDI r12, 48
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
