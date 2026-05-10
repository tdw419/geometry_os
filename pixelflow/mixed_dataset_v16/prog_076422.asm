; DESCRIPTION: Composite: Draws a yellow line from (82, 174) to (250, 136) then Sets a single blue pixel at (328, 230) then Places a magenta circle of radius 37 at center (52, 182).
; PLAN: r0=82(x1), r1=174(y1), r2=250(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=230(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=52(x), r11=182(y), r12=37(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 82
LDI r1, 174
LDI r2, 250
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 230
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 52
LDI r11, 182
LDI r12, 37
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
