; DESCRIPTION: Composite: Creates a red rectangular region at (185, 125) spanning 52 by 73 pixels then Places a red line segment connecting (199, 167) to (135, 5) then Creates a green circular shape at (198, 169) with radius 66.
; PLAN: r0=185(x), r1=125(y), r2=52(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x1), r6=167(y1), r7=135(x2), r8=5(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=198(x), r11=169(y), r12=66(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 185
LDI r1, 125
LDI r2, 52
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 167
LDI r7, 135
LDI r8, 5
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 169
LDI r12, 66
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
