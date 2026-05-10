; DESCRIPTION: Composite: Creates a white rectangular region at (214, 201) spanning 50 by 14 pixels then Renders a blue line between points (78, 187) and (453, 157) then Creates a magenta circular shape at (407, 77) with radius 73.
; PLAN: r0=214(x), r1=201(y), r2=50(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x1), r6=187(y1), r7=453(x2), r8=157(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=407(x), r11=77(y), r12=73(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 214
LDI r1, 201
LDI r2, 50
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 187
LDI r7, 453
LDI r8, 157
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 77
LDI r12, 73
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
