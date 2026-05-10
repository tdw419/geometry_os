; DESCRIPTION: Composite: Draws a orange circle centered at (231, 86) with radius 33 then Draws a blue rectangle at (302, 148) with width 92 and height 81 then Places a green line segment connecting (172, 148) to (329, 229).
; PLAN: r0=231(x), r1=86(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x), r6=148(y), r7=92(width), r8=81(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=172(x1), r11=148(y1), r12=329(x2), r13=229(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 86
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 148
LDI r7, 92
LDI r8, 81
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 148
LDI r12, 329
LDI r13, 229
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
