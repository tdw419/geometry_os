; DESCRIPTION: Composite: Places a red 62x116 rectangle at position (323, 6) then Sets a single blue pixel at (136, 179) then Draws a blue line from (270, 169) to (89, 237).
; PLAN: r0=323(x), r1=6(y), r2=62(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=179(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=270(x1), r11=169(y1), r12=89(x2), r13=237(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 6
LDI r2, 62
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 179
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 270
LDI r11, 169
LDI r12, 89
LDI r13, 237
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
