; DESCRIPTION: Composite: Renders a magenta line between points (307, 136) and (389, 145) then Sets a single magenta pixel at (132, 175) then Renders a green disk with center (206, 188) and radius 43.
; PLAN: r0=307(x1), r1=136(y1), r2=389(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=175(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=206(x), r11=188(y), r12=43(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 136
LDI r2, 389
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 175
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 206
LDI r11, 188
LDI r12, 43
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
