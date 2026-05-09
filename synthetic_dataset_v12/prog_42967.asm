; DESCRIPTION: Composite: Draws a magenta line from (204, 35) to (183, 39) then Draws a blue circle centered at (133, 162) with radius 61 then Sets a single black pixel at (325, 52).
; PLAN: r0=204(x1), r1=35(y1), r2=183(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=162(y), r7=61(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=325(x), r11=52(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 204
LDI r1, 35
LDI r2, 183
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 162
LDI r7, 61
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 325
LDI r11, 52
LDI r12, 0x000000
PSET r10, r11, r12
HALT
