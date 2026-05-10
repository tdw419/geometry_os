; DESCRIPTION: Composite: Renders a blue line between points (376, 166) and (321, 10) then Draws a purple circle centered at (155, 82) with radius 72 then Sets a single black pixel at (266, 120).
; PLAN: r0=376(x1), r1=166(y1), r2=321(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=155(x), r6=82(y), r7=72(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=266(x), r11=120(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 166
LDI r2, 321
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 82
LDI r7, 72
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 266
LDI r11, 120
LDI r12, 0x000000
PSET r10, r11, r12
HALT
