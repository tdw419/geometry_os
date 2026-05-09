; DESCRIPTION: Composite: Places a blue line segment connecting (252, 116) to (333, 235) then Sets a single red pixel at (253, 97) then Draws a yellow circle centered at (246, 144) with radius 63.
; PLAN: r0=252(x1), r1=116(y1), r2=333(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=97(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=246(x), r11=144(y), r12=63(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 252
LDI r1, 116
LDI r2, 333
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 97
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 246
LDI r11, 144
LDI r12, 63
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
