; DESCRIPTION: Composite: Renders a purple box of size 100x85 starting at (235, 89) then Renders a purple disk with center (320, 163) and radius 58 then Draws a green line from (408, 112) to (468, 254).
; PLAN: r0=235(x), r1=89(y), r2=100(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=320(x), r6=163(y), r7=58(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=408(x1), r11=112(y1), r12=468(x2), r13=254(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 89
LDI r2, 100
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 163
LDI r7, 58
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 408
LDI r11, 112
LDI r12, 468
LDI r13, 254
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
