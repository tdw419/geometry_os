; DESCRIPTION: Composite: Draws a blue line from (113, 154) to (372, 58) then Sets a single blue pixel at (237, 70) then Draws a magenta circle centered at (110, 132) with radius 59.
; PLAN: r0=113(x1), r1=154(y1), r2=372(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=70(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=110(x), r11=132(y), r12=59(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 113
LDI r1, 154
LDI r2, 372
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 70
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 110
LDI r11, 132
LDI r12, 59
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
