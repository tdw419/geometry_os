; DESCRIPTION: Composite: Places a red line segment connecting (403, 35) to (376, 36) then Creates a orange rectangular region at (136, 25) spanning 85 by 35 pixels then Draws a blue circle centered at (67, 120) with radius 22.
; PLAN: r0=403(x1), r1=35(y1), r2=376(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=136(x), r6=25(y), r7=85(width), r8=35(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=67(x), r11=120(y), r12=22(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 35
LDI r2, 376
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 25
LDI r7, 85
LDI r8, 35
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 120
LDI r12, 22
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
