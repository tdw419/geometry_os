; DESCRIPTION: Composite: Places a magenta line segment connecting (464, 235) to (387, 230) then Places a blue dot at position (322, 147) then Places a black circle of radius 11 at center (492, 80).
; PLAN: r0=464(x1), r1=235(y1), r2=387(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=147(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=492(x), r11=80(y), r12=11(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 235
LDI r2, 387
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 147
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 492
LDI r11, 80
LDI r12, 11
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
