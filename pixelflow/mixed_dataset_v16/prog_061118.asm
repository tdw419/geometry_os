; DESCRIPTION: Composite: Places a white line segment connecting (76, 47) to (96, 132) then Places a orange circle of radius 79 at center (90, 161) then Creates a magenta rectangular region at (465, 192) spanning 34 by 31 pixels.
; PLAN: r0=76(x1), r1=47(y1), r2=96(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=161(y), r7=79(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=465(x), r11=192(y), r12=34(width), r13=31(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 47
LDI r2, 96
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 161
LDI r7, 79
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 465
LDI r11, 192
LDI r12, 34
LDI r13, 31
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
