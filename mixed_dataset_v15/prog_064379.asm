; DESCRIPTION: Composite: Draws a red line from (192, 83) to (278, 43) then Sets a single magenta pixel at (337, 159).
; PLAN: r0=192(x1), r1=83(y1), r2=278(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=159(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 192
LDI r1, 83
LDI r2, 278
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 159
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
