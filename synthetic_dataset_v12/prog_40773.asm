; DESCRIPTION: Composite: Draws a purple circle centered at (368, 170) with radius 32 then Sets a single blue pixel at (460, 145) then Places a yellow line segment connecting (280, 226) to (460, 46).
; PLAN: r0=368(x), r1=170(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x), r6=145(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=280(x1), r11=226(y1), r12=460(x2), r13=46(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 170
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 145
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 280
LDI r11, 226
LDI r12, 460
LDI r13, 46
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
