; DESCRIPTION: Composite: Places a purple line segment connecting (129, 93) to (472, 187) then Draws a white rectangle at (451, 23) with width 19 and height 74 then Renders a green disk with center (38, 51) and radius 19.
; PLAN: r0=129(x1), r1=93(y1), r2=472(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=451(x), r6=23(y), r7=19(width), r8=74(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=38(x), r11=51(y), r12=19(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 93
LDI r2, 472
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 23
LDI r7, 19
LDI r8, 74
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 38
LDI r11, 51
LDI r12, 19
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
