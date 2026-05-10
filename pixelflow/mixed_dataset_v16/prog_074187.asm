; DESCRIPTION: Composite: Places a purple 100x117 rectangle at position (88, 100) then Sets a single red pixel at (402, 187) then Creates a yellow circular shape at (188, 55) with radius 52.
; PLAN: r0=88(x), r1=100(y), r2=100(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=187(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=188(x), r11=55(y), r12=52(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 88
LDI r1, 100
LDI r2, 100
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 187
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 188
LDI r11, 55
LDI r12, 52
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
