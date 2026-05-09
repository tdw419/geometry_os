; DESCRIPTION: Composite: Places a magenta line segment connecting (469, 224) to (170, 157) then Sets a single purple pixel at (176, 218) then Renders a blue disk with center (181, 108) and radius 27.
; PLAN: r0=469(x1), r1=224(y1), r2=170(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=218(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=181(x), r11=108(y), r12=27(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 469
LDI r1, 224
LDI r2, 170
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 218
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 181
LDI r11, 108
LDI r12, 27
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
