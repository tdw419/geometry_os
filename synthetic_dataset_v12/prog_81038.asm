; DESCRIPTION: Composite: Draws a orange line from (56, 86) to (423, 89) then Sets a single red pixel at (507, 27) then Draws a magenta rectangle at (396, 41) with width 108 and height 79.
; PLAN: r0=56(x1), r1=86(y1), r2=423(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=507(x), r6=27(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=396(x), r11=41(y), r12=108(width), r13=79(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 86
LDI r2, 423
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 27
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 396
LDI r11, 41
LDI r12, 108
LDI r13, 79
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
