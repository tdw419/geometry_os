; DESCRIPTION: Composite: Renders a blue box of size 13x49 starting at (100, 127) then Sets a single red pixel at (266, 18) then Creates a green circular shape at (447, 104) with radius 60.
; PLAN: r0=100(x), r1=127(y), r2=13(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=18(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=447(x), r11=104(y), r12=60(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 100
LDI r1, 127
LDI r2, 13
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 18
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 447
LDI r11, 104
LDI r12, 60
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
