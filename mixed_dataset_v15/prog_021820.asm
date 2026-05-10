; DESCRIPTION: Composite: Draws a blue line from (123, 218) to (390, 184) then Places a black circle of radius 79 at center (300, 122) then Sets a single magenta pixel at (91, 84).
; PLAN: r0=123(x1), r1=218(y1), r2=390(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=122(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=91(x), r11=84(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 123
LDI r1, 218
LDI r2, 390
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 122
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 91
LDI r11, 84
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
