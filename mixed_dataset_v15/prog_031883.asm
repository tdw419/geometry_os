; DESCRIPTION: Composite: Renders a magenta line between points (326, 221) and (351, 47) then Renders a orange box of size 31x51 starting at (40, 172) then Draws a blue circle centered at (259, 181) with radius 18.
; PLAN: r0=326(x1), r1=221(y1), r2=351(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=172(y), r7=31(width), r8=51(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=259(x), r11=181(y), r12=18(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 326
LDI r1, 221
LDI r2, 351
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 172
LDI r7, 31
LDI r8, 51
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 181
LDI r12, 18
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
