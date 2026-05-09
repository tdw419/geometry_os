; DESCRIPTION: Composite: Renders a purple line between points (164, 244) and (378, 148) then Creates a cyan rectangular region at (103, 4) spanning 13 by 120 pixels then Creates a orange circular shape at (191, 113) with radius 25.
; PLAN: r0=164(x1), r1=244(y1), r2=378(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=4(y), r7=13(width), r8=120(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=191(x), r11=113(y), r12=25(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 244
LDI r2, 378
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 4
LDI r7, 13
LDI r8, 120
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 191
LDI r11, 113
LDI r12, 25
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
