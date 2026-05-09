; DESCRIPTION: Composite: Draws a purple line from (181, 235) to (266, 180) then Draws a orange circle centered at (396, 202) with radius 13.
; PLAN: r0=181(x1), r1=235(y1), r2=266(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=202(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 181
LDI r1, 235
LDI r2, 266
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 202
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
