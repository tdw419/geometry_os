; DESCRIPTION: Composite: Creates a purple rectangular region at (80, 33) spanning 71 by 84 pixels then Renders a blue line between points (101, 176) and (278, 160) then Places a white circle of radius 75 at center (199, 156).
; PLAN: r0=80(x), r1=33(y), r2=71(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x1), r6=176(y1), r7=278(x2), r8=160(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=199(x), r11=156(y), r12=75(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 80
LDI r1, 33
LDI r2, 71
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 176
LDI r7, 278
LDI r8, 160
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 156
LDI r12, 75
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
