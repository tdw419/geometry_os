; DESCRIPTION: Composite: Draws a white line from (508, 192) to (415, 99) then Places a white circle of radius 38 at center (365, 188) then Creates a orange rectangular region at (170, 84) spanning 110 by 65 pixels.
; PLAN: r0=508(x1), r1=192(y1), r2=415(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=188(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=170(x), r11=84(y), r12=110(width), r13=65(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 192
LDI r2, 415
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 188
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 170
LDI r11, 84
LDI r12, 110
LDI r13, 65
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
