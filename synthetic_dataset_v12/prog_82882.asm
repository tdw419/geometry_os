; DESCRIPTION: Composite: Draws a yellow circle centered at (338, 155) with radius 19 then Renders a purple line between points (357, 183) and (102, 131) then Sets a single white pixel at (456, 197).
; PLAN: r0=338(x), r1=155(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x1), r6=183(y1), r7=102(x2), r8=131(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=456(x), r11=197(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 338
LDI r1, 155
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 183
LDI r7, 102
LDI r8, 131
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 197
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
