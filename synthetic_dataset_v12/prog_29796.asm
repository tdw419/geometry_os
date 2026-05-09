; DESCRIPTION: Composite: Draws a orange line from (235, 63) to (81, 148) then Renders a purple disk with center (301, 187) and radius 30 then Sets a single red pixel at (334, 22).
; PLAN: r0=235(x1), r1=63(y1), r2=81(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=187(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=334(x), r11=22(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 235
LDI r1, 63
LDI r2, 81
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 187
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 334
LDI r11, 22
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
