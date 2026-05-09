; DESCRIPTION: Composite: Creates a white circular shape at (142, 156) with radius 51 then Draws a purple line from (357, 185) to (198, 55) then Sets a single black pixel at (429, 209).
; PLAN: r0=142(x), r1=156(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x1), r6=185(y1), r7=198(x2), r8=55(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=429(x), r11=209(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 142
LDI r1, 156
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 185
LDI r7, 198
LDI r8, 55
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 209
LDI r12, 0x000000
PSET r10, r11, r12
HALT
