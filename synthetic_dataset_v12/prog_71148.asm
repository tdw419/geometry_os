; DESCRIPTION: Composite: Places a orange line segment connecting (288, 190) to (38, 227) then Creates a cyan rectangular region at (63, 204) spanning 90 by 52 pixels then Places a green circle of radius 57 at center (105, 88).
; PLAN: r0=288(x1), r1=190(y1), r2=38(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=204(y), r7=90(width), r8=52(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=105(x), r11=88(y), r12=57(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 288
LDI r1, 190
LDI r2, 38
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 204
LDI r7, 90
LDI r8, 52
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 88
LDI r12, 57
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
