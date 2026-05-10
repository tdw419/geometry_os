; DESCRIPTION: Composite: Places a black circle of radius 18 at center (81, 95) then Sets a single red pixel at (385, 246) then Draws a yellow line from (310, 175) to (61, 72).
; PLAN: r0=81(x), r1=95(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=246(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=310(x1), r11=175(y1), r12=61(x2), r13=72(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 95
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 246
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 310
LDI r11, 175
LDI r12, 61
LDI r13, 72
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
