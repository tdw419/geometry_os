; DESCRIPTION: Composite: Renders a red disk with center (323, 184) and radius 62 then Renders a red line between points (396, 51) and (471, 132) then Places a green dot at position (194, 28).
; PLAN: r0=323(x), r1=184(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x1), r6=51(y1), r7=471(x2), r8=132(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=28(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 323
LDI r1, 184
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 51
LDI r7, 471
LDI r8, 132
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 28
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
