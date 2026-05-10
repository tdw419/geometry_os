; DESCRIPTION: Composite: Renders a yellow line between points (476, 148) and (290, 166) then Places a yellow circle of radius 62 at center (427, 105) then Sets a single red pixel at (27, 33).
; PLAN: r0=476(x1), r1=148(y1), r2=290(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=105(y), r7=62(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=27(x), r11=33(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 476
LDI r1, 148
LDI r2, 290
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 105
LDI r7, 62
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 27
LDI r11, 33
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
