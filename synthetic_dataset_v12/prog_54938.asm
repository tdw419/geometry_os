; DESCRIPTION: Composite: Renders a yellow line between points (55, 10) and (20, 120) then Draws a orange rectangle at (284, 126) with width 70 and height 73 then Renders a blue disk with center (396, 181) and radius 74.
; PLAN: r0=55(x1), r1=10(y1), r2=20(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=126(y), r7=70(width), r8=73(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=396(x), r11=181(y), r12=74(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 55
LDI r1, 10
LDI r2, 20
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 126
LDI r7, 70
LDI r8, 73
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 181
LDI r12, 74
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
