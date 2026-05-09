; DESCRIPTION: Composite: Draws a blue circle centered at (155, 112) with radius 79 then Places a green 101x119 rectangle at position (399, 107) then Places a orange line segment connecting (201, 93) to (61, 122).
; PLAN: r0=155(x), r1=112(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=399(x), r6=107(y), r7=101(width), r8=119(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=201(x1), r11=93(y1), r12=61(x2), r13=122(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 112
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 399
LDI r6, 107
LDI r7, 101
LDI r8, 119
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 93
LDI r12, 61
LDI r13, 122
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
