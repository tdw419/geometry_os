; DESCRIPTION: Composite: Sets a single blue pixel at (147, 176) then Places a black circle of radius 49 at center (219, 162) then Places a blue line segment connecting (320, 130) to (254, 104).
; PLAN: r0=147(x), r1=176(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=162(y), r7=49(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=320(x1), r11=130(y1), r12=254(x2), r13=104(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 176
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 219
LDI r6, 162
LDI r7, 49
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 320
LDI r11, 130
LDI r12, 254
LDI r13, 104
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
