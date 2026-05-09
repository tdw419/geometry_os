; DESCRIPTION: Composite: Places a blue line segment connecting (175, 187) to (376, 184) then Renders a red box of size 92x85 starting at (412, 65) then Draws a black circle centered at (473, 180) with radius 12.
; PLAN: r0=175(x1), r1=187(y1), r2=376(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=412(x), r6=65(y), r7=92(width), r8=85(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=473(x), r11=180(y), r12=12(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 187
LDI r2, 376
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 65
LDI r7, 92
LDI r8, 85
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 473
LDI r11, 180
LDI r12, 12
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
