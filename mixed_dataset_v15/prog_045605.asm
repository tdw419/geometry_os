; DESCRIPTION: Composite: Draws a yellow rectangle at (179, 7) with width 74 and height 68 then Renders a yellow disk with center (140, 229) and radius 13 then Places a green line segment connecting (396, 211) to (87, 132).
; PLAN: r0=179(x), r1=7(y), r2=74(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x), r6=229(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x1), r11=211(y1), r12=87(x2), r13=132(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 7
LDI r2, 74
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 229
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 211
LDI r12, 87
LDI r13, 132
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
