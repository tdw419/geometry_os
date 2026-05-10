; DESCRIPTION: Composite: Places a yellow 43x26 rectangle at position (416, 40) then Renders a magenta line between points (348, 52) and (292, 254) then Creates a yellow circular shape at (132, 170) with radius 67.
; PLAN: r0=416(x), r1=40(y), r2=43(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x1), r6=52(y1), r7=292(x2), r8=254(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=132(x), r11=170(y), r12=67(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 416
LDI r1, 40
LDI r2, 43
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 52
LDI r7, 292
LDI r8, 254
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 170
LDI r12, 67
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
