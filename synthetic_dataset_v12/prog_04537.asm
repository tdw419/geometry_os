; DESCRIPTION: Composite: Draws a green line from (111, 122) to (459, 146) then Creates a white rectangular region at (18, 78) spanning 80 by 62 pixels then Draws a orange circle centered at (356, 196) with radius 54.
; PLAN: r0=111(x1), r1=122(y1), r2=459(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=18(x), r6=78(y), r7=80(width), r8=62(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x), r11=196(y), r12=54(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 111
LDI r1, 122
LDI r2, 459
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 78
LDI r7, 80
LDI r8, 62
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 196
LDI r12, 54
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
