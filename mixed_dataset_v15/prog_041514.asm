; DESCRIPTION: Composite: Draws a orange circle centered at (193, 52) with radius 17 then Sets a single black pixel at (195, 247) then Draws a purple line from (457, 81) to (240, 54).
; PLAN: r0=193(x), r1=52(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x), r6=247(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=457(x1), r11=81(y1), r12=240(x2), r13=54(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 52
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 247
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 457
LDI r11, 81
LDI r12, 240
LDI r13, 54
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
