; DESCRIPTION: Composite: Sets a single white pixel at (395, 171) then Renders a orange line between points (112, 185) and (433, 237) then Draws a yellow circle centered at (321, 121) with radius 80.
; PLAN: r0=395(x), r1=171(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=112(x1), r6=185(y1), r7=433(x2), r8=237(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=321(x), r11=121(y), r12=80(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 395
LDI r1, 171
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 112
LDI r6, 185
LDI r7, 433
LDI r8, 237
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 121
LDI r12, 80
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
