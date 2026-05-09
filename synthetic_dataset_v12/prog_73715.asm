; DESCRIPTION: Composite: Places a orange circle of radius 49 at center (459, 138) then Sets a single red pixel at (65, 12) then Draws a red line from (366, 71) to (123, 56).
; PLAN: r0=459(x), r1=138(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x), r6=12(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=366(x1), r11=71(y1), r12=123(x2), r13=56(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 138
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 12
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 366
LDI r11, 71
LDI r12, 123
LDI r13, 56
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
