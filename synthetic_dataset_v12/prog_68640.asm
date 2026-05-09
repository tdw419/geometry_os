; DESCRIPTION: Composite: Draws a green line from (105, 246) to (295, 189) then Sets a single purple pixel at (249, 153) then Draws a magenta circle centered at (451, 148) with radius 15.
; PLAN: r0=105(x1), r1=246(y1), r2=295(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=153(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=451(x), r11=148(y), r12=15(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 105
LDI r1, 246
LDI r2, 295
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 153
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 451
LDI r11, 148
LDI r12, 15
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
