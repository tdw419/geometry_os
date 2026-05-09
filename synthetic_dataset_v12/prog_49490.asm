; DESCRIPTION: Composite: Draws a blue rectangle at (306, 45) with width 84 and height 117 then Places a orange line segment connecting (5, 3) to (394, 60) then Renders a black disk with center (62, 109) and radius 52.
; PLAN: r0=306(x), r1=45(y), r2=84(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=5(x1), r6=3(y1), r7=394(x2), r8=60(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=62(x), r11=109(y), r12=52(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 306
LDI r1, 45
LDI r2, 84
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 3
LDI r7, 394
LDI r8, 60
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 109
LDI r12, 52
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
