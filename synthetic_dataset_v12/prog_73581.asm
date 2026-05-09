; DESCRIPTION: Composite: Draws a purple line from (131, 87) to (17, 30) then Places a blue dot at position (349, 161) then Draws a orange circle centered at (170, 123) with radius 72.
; PLAN: r0=131(x1), r1=87(y1), r2=17(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=161(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=170(x), r11=123(y), r12=72(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 87
LDI r2, 17
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 161
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 170
LDI r11, 123
LDI r12, 72
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
