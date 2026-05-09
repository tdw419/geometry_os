; DESCRIPTION: Composite: Draws a red line from (201, 32) to (201, 101) then Sets a single white pixel at (312, 136) then Draws a red circle centered at (385, 125) with radius 53.
; PLAN: r0=201(x1), r1=32(y1), r2=201(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=136(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=385(x), r11=125(y), r12=53(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 201
LDI r1, 32
LDI r2, 201
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 136
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 385
LDI r11, 125
LDI r12, 53
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
