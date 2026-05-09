; DESCRIPTION: Composite: Renders a purple line between points (105, 229) and (491, 203) then Sets a single black pixel at (279, 51) then Places a green circle of radius 74 at center (224, 88).
; PLAN: r0=105(x1), r1=229(y1), r2=491(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=51(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=224(x), r11=88(y), r12=74(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 105
LDI r1, 229
LDI r2, 491
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 51
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 224
LDI r11, 88
LDI r12, 74
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
