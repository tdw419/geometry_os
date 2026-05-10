; DESCRIPTION: Composite: Renders a black line between points (66, 94) and (220, 124) then Renders a black box of size 101x83 starting at (95, 20) then Draws a purple circle centered at (198, 194) with radius 62.
; PLAN: r0=66(x1), r1=94(y1), r2=220(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=20(y), r7=101(width), r8=83(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=198(x), r11=194(y), r12=62(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 94
LDI r2, 220
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 20
LDI r7, 101
LDI r8, 83
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 194
LDI r12, 62
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
