; DESCRIPTION: Composite: Places a yellow circle of radius 65 at center (251, 174) then Sets a single orange pixel at (157, 92) then Renders a green line between points (201, 114) and (453, 108).
; PLAN: r0=251(x), r1=174(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=92(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=201(x1), r11=114(y1), r12=453(x2), r13=108(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 174
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 92
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 201
LDI r11, 114
LDI r12, 453
LDI r13, 108
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
