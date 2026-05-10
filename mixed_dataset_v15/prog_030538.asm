; DESCRIPTION: Composite: Draws a blue line from (488, 232) to (408, 185) then Draws a orange circle centered at (222, 87) with radius 41.
; PLAN: r0=488(x1), r1=232(y1), r2=408(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=87(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 488
LDI r1, 232
LDI r2, 408
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 87
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
