; DESCRIPTION: Composite: Places a blue line segment connecting (157, 155) to (27, 179) then Creates a black rectangular region at (352, 139) spanning 83 by 96 pixels then Creates a green circular shape at (227, 95) with radius 77.
; PLAN: r0=157(x1), r1=155(y1), r2=27(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=352(x), r6=139(y), r7=83(width), r8=96(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=227(x), r11=95(y), r12=77(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 157
LDI r1, 155
LDI r2, 27
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 139
LDI r7, 83
LDI r8, 96
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 95
LDI r12, 77
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
