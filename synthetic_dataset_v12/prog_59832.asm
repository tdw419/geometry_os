; DESCRIPTION: Composite: Draws a red line from (349, 209) to (184, 48) then Sets a single white pixel at (385, 174) then Renders a yellow disk with center (417, 77) and radius 72.
; PLAN: r0=349(x1), r1=209(y1), r2=184(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=385(x), r6=174(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=417(x), r11=77(y), r12=72(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 349
LDI r1, 209
LDI r2, 184
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 174
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 417
LDI r11, 77
LDI r12, 72
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
