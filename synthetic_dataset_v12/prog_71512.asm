; DESCRIPTION: Composite: Creates a orange rectangular region at (135, 5) spanning 25 by 89 pixels then Renders a red line between points (30, 232) and (331, 219) then Places a green circle of radius 22 at center (383, 215).
; PLAN: r0=135(x), r1=5(y), r2=25(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=30(x1), r6=232(y1), r7=331(x2), r8=219(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=383(x), r11=215(y), r12=22(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 135
LDI r1, 5
LDI r2, 25
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 232
LDI r7, 331
LDI r8, 219
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 215
LDI r12, 22
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
