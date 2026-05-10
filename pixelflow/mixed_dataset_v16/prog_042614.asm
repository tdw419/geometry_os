; DESCRIPTION: Composite: Renders a purple disk with center (319, 53) and radius 18 then Sets a single red pixel at (222, 6) then Draws a green line from (151, 136) to (224, 22).
; PLAN: r0=319(x), r1=53(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x), r6=6(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=151(x1), r11=136(y1), r12=224(x2), r13=22(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 53
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 6
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 151
LDI r11, 136
LDI r12, 224
LDI r13, 22
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
