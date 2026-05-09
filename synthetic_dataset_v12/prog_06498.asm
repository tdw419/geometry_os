; DESCRIPTION: Composite: Renders a magenta line between points (280, 39) and (196, 145) then Sets a single purple pixel at (427, 235) then Renders a green disk with center (238, 50) and radius 26.
; PLAN: r0=280(x1), r1=39(y1), r2=196(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=235(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=238(x), r11=50(y), r12=26(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 280
LDI r1, 39
LDI r2, 196
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 235
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 238
LDI r11, 50
LDI r12, 26
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
