; DESCRIPTION: Composite: Places a purple line segment connecting (197, 67) to (408, 98) then Draws a black circle centered at (421, 112) with radius 21 then Sets a single blue pixel at (235, 175).
; PLAN: r0=197(x1), r1=67(y1), r2=408(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=112(y), r7=21(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=235(x), r11=175(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 197
LDI r1, 67
LDI r2, 408
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 112
LDI r7, 21
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 235
LDI r11, 175
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
