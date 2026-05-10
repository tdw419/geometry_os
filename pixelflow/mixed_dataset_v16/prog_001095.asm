; DESCRIPTION: Composite: Places a black line segment connecting (404, 200) to (44, 212) then Places a red 97x88 rectangle at position (110, 124) then Draws a purple circle centered at (389, 61) with radius 59.
; PLAN: r0=404(x1), r1=200(y1), r2=44(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=124(y), r7=97(width), r8=88(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=389(x), r11=61(y), r12=59(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 404
LDI r1, 200
LDI r2, 44
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 124
LDI r7, 97
LDI r8, 88
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 389
LDI r11, 61
LDI r12, 59
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
