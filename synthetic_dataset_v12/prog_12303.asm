; DESCRIPTION: Composite: Sets a single green pixel at (350, 92) then Places a yellow circle of radius 71 at center (290, 105) then Draws a black line from (439, 183) to (473, 97).
; PLAN: r0=350(x), r1=92(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=105(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=439(x1), r11=183(y1), r12=473(x2), r13=97(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 92
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 290
LDI r6, 105
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 439
LDI r11, 183
LDI r12, 473
LDI r13, 97
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
