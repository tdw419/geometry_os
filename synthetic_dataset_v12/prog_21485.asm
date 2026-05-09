; DESCRIPTION: Composite: Places a yellow line segment connecting (309, 170) to (60, 59) then Renders a blue box of size 89x67 starting at (36, 14) then Draws a purple circle centered at (262, 151) with radius 43.
; PLAN: r0=309(x1), r1=170(y1), r2=60(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=36(x), r6=14(y), r7=89(width), r8=67(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=262(x), r11=151(y), r12=43(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 309
LDI r1, 170
LDI r2, 60
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 14
LDI r7, 89
LDI r8, 67
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 151
LDI r12, 43
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
