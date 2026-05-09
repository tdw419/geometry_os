; DESCRIPTION: Composite: Renders a yellow box of size 18x104 starting at (224, 147) then Sets a single red pixel at (254, 124) then Places a purple line segment connecting (347, 43) to (114, 195).
; PLAN: r0=224(x), r1=147(y), r2=18(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x), r6=124(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=347(x1), r11=43(y1), r12=114(x2), r13=195(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 224
LDI r1, 147
LDI r2, 18
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 124
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 347
LDI r11, 43
LDI r12, 114
LDI r13, 195
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
