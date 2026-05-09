; DESCRIPTION: Composite: Draws a magenta circle centered at (419, 76) with radius 63 then Draws a yellow rectangle at (60, 138) with width 30 and height 41 then Places a orange line segment connecting (246, 51) to (363, 115).
; PLAN: r0=419(x), r1=76(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x), r6=138(y), r7=30(width), r8=41(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=246(x1), r11=51(y1), r12=363(x2), r13=115(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 76
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 138
LDI r7, 30
LDI r8, 41
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 51
LDI r12, 363
LDI r13, 115
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
