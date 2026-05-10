; DESCRIPTION: Composite: Places a blue line segment connecting (2, 249) to (295, 56) then Sets a single black pixel at (185, 147) then Renders a white disk with center (225, 94) and radius 79.
; PLAN: r0=2(x1), r1=249(y1), r2=295(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=147(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=225(x), r11=94(y), r12=79(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 2
LDI r1, 249
LDI r2, 295
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 147
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 225
LDI r11, 94
LDI r12, 79
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
