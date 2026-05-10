; DESCRIPTION: Composite: Places a yellow line segment connecting (264, 163) to (433, 213) then Sets a single purple pixel at (493, 56) then Creates a orange circular shape at (384, 201) with radius 35.
; PLAN: r0=264(x1), r1=163(y1), r2=433(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=493(x), r6=56(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=384(x), r11=201(y), r12=35(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 163
LDI r2, 433
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 493
LDI r6, 56
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 384
LDI r11, 201
LDI r12, 35
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
