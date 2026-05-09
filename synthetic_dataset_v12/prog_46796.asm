; DESCRIPTION: Composite: Renders a yellow line between points (130, 112) and (278, 189) then Places a red circle of radius 74 at center (312, 153) then Sets a single black pixel at (30, 233).
; PLAN: r0=130(x1), r1=112(y1), r2=278(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=153(y), r7=74(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=30(x), r11=233(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 130
LDI r1, 112
LDI r2, 278
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 153
LDI r7, 74
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 30
LDI r11, 233
LDI r12, 0x000000
PSET r10, r11, r12
HALT
