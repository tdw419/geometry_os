; DESCRIPTION: Composite: Places a black 52x82 rectangle at position (414, 162) then Draws a orange line from (496, 53) to (84, 79) then Renders a red disk with center (222, 182) and radius 10.
; PLAN: r0=414(x), r1=162(y), r2=52(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=496(x1), r6=53(y1), r7=84(x2), r8=79(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=222(x), r11=182(y), r12=10(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 414
LDI r1, 162
LDI r2, 52
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 53
LDI r7, 84
LDI r8, 79
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 182
LDI r12, 10
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
