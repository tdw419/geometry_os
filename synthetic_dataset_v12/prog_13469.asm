; DESCRIPTION: Composite: Creates a green circular shape at (263, 65) with radius 59 then Draws a blue line from (442, 4) to (185, 41) then Creates a green rectangular region at (131, 15) spanning 113 by 50 pixels.
; PLAN: r0=263(x), r1=65(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x1), r6=4(y1), r7=185(x2), r8=41(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=131(x), r11=15(y), r12=113(width), r13=50(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 65
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 4
LDI r7, 185
LDI r8, 41
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 15
LDI r12, 113
LDI r13, 50
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
