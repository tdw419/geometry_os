; DESCRIPTION: Composite: Renders a blue box of size 66x52 starting at (265, 192) then Draws a black circle centered at (442, 157) with radius 70 then Renders a purple line between points (484, 8) and (45, 35).
; PLAN: r0=265(x), r1=192(y), r2=66(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=157(y), r7=70(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=484(x1), r11=8(y1), r12=45(x2), r13=35(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 192
LDI r2, 66
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 157
LDI r7, 70
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 484
LDI r11, 8
LDI r12, 45
LDI r13, 35
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
