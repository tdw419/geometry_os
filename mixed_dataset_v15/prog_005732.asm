; DESCRIPTION: Composite: Draws a black line from (159, 207) to (314, 243) then Sets a single blue pixel at (135, 235) then Renders a yellow box of size 90x24 starting at (384, 203).
; PLAN: r0=159(x1), r1=207(y1), r2=314(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=235(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=384(x), r11=203(y), r12=90(width), r13=24(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 207
LDI r2, 314
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 235
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 384
LDI r11, 203
LDI r12, 90
LDI r13, 24
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
