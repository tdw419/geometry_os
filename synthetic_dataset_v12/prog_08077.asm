; DESCRIPTION: Composite: Renders a magenta line between points (331, 134) and (269, 1) then Places a yellow 77x111 rectangle at position (200, 133) then Draws a purple circle centered at (84, 170) with radius 42.
; PLAN: r0=331(x1), r1=134(y1), r2=269(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=133(y), r7=77(width), r8=111(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=84(x), r11=170(y), r12=42(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 331
LDI r1, 134
LDI r2, 269
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 133
LDI r7, 77
LDI r8, 111
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 170
LDI r12, 42
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
