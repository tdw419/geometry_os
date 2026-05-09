; DESCRIPTION: Composite: Creates a black circular shape at (277, 192) with radius 36 then Sets a single orange pixel at (298, 109) then Renders a black line between points (278, 40) and (379, 114).
; PLAN: r0=277(x), r1=192(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x), r6=109(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=278(x1), r11=40(y1), r12=379(x2), r13=114(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 192
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 109
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 278
LDI r11, 40
LDI r12, 379
LDI r13, 114
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
