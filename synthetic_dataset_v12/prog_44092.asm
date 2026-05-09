; DESCRIPTION: Composite: Creates a purple circular shape at (98, 57) with radius 39 then Sets a single black pixel at (312, 78) then Renders a blue line between points (399, 95) and (368, 160).
; PLAN: r0=98(x), r1=57(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=78(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=399(x1), r11=95(y1), r12=368(x2), r13=160(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 57
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 78
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 399
LDI r11, 95
LDI r12, 368
LDI r13, 160
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
