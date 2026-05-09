; DESCRIPTION: Composite: Draws a purple line from (451, 188) to (108, 199) then Renders a white box of size 40x29 starting at (442, 25) then Draws a red circle centered at (256, 139) with radius 40.
; PLAN: r0=451(x1), r1=188(y1), r2=108(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=25(y), r7=40(width), r8=29(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x), r11=139(y), r12=40(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 451
LDI r1, 188
LDI r2, 108
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 25
LDI r7, 40
LDI r8, 29
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 139
LDI r12, 40
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
