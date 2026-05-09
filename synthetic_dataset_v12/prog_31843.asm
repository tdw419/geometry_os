; DESCRIPTION: Composite: Renders a purple line between points (100, 251) and (286, 72) then Places a yellow circle of radius 62 at center (103, 68) then Sets a single green pixel at (390, 204).
; PLAN: r0=100(x1), r1=251(y1), r2=286(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=68(y), r7=62(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=390(x), r11=204(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 251
LDI r2, 286
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 68
LDI r7, 62
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 390
LDI r11, 204
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
