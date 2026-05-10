; DESCRIPTION: Composite: Places a black line segment connecting (184, 58) to (229, 192) then Places a blue circle of radius 72 at center (90, 124) then Sets a single red pixel at (472, 234).
; PLAN: r0=184(x1), r1=58(y1), r2=229(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=124(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=472(x), r11=234(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 58
LDI r2, 229
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 124
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 472
LDI r11, 234
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
