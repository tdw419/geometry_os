; DESCRIPTION: Composite: Renders a red disk with center (232, 150) and radius 33 then Draws a cyan rectangle at (0, 69) with width 45 and height 54 then Renders a purple line between points (359, 142) and (60, 160).
; PLAN: r0=232(x), r1=150(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x), r6=69(y), r7=45(width), r8=54(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=359(x1), r11=142(y1), r12=60(x2), r13=160(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 150
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 69
LDI r7, 45
LDI r8, 54
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 142
LDI r12, 60
LDI r13, 160
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
