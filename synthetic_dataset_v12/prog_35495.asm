; DESCRIPTION: Composite: Places a yellow circle of radius 40 at center (123, 53) then Sets a single orange pixel at (509, 156) then Draws a orange line from (17, 238) to (427, 244).
; PLAN: r0=123(x), r1=53(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=509(x), r6=156(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=17(x1), r11=238(y1), r12=427(x2), r13=244(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 53
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 509
LDI r6, 156
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 17
LDI r11, 238
LDI r12, 427
LDI r13, 244
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
