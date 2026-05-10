; DESCRIPTION: Composite: Places a black line segment connecting (390, 162) to (85, 108) then Sets a single white pixel at (104, 14) then Places a black circle of radius 67 at center (280, 85).
; PLAN: r0=390(x1), r1=162(y1), r2=85(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=14(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=280(x), r11=85(y), r12=67(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 390
LDI r1, 162
LDI r2, 85
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 14
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 280
LDI r11, 85
LDI r12, 67
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
