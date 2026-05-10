; DESCRIPTION: Composite: Creates a white circular shape at (321, 189) with radius 52 then Sets a single green pixel at (316, 28) then Draws a purple line from (189, 114) to (453, 211).
; PLAN: r0=321(x), r1=189(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=28(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=189(x1), r11=114(y1), r12=453(x2), r13=211(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 189
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 28
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 189
LDI r11, 114
LDI r12, 453
LDI r13, 211
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
