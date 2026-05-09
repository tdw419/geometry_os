; DESCRIPTION: Composite: Places a purple line segment connecting (494, 123) to (159, 224) then Sets a single white pixel at (468, 45) then Places a yellow 89x86 rectangle at position (390, 23).
; PLAN: r0=494(x1), r1=123(y1), r2=159(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=468(x), r6=45(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=390(x), r11=23(y), r12=89(width), r13=86(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 494
LDI r1, 123
LDI r2, 159
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 45
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 390
LDI r11, 23
LDI r12, 89
LDI r13, 86
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
