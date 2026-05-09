; DESCRIPTION: Composite: Renders a white disk with center (414, 160) and radius 15 then Sets a single black pixel at (37, 98) then Draws a yellow line from (189, 218) to (310, 70).
; PLAN: r0=414(x), r1=160(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=98(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=189(x1), r11=218(y1), r12=310(x2), r13=70(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 414
LDI r1, 160
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 98
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 189
LDI r11, 218
LDI r12, 310
LDI r13, 70
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
