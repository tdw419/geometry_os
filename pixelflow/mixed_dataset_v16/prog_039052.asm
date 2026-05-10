; DESCRIPTION: Composite: Renders a green disk with center (51, 147) and radius 37 then Draws a purple line from (90, 142) to (51, 192) then Sets a single magenta pixel at (336, 255).
; PLAN: r0=51(x), r1=147(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x1), r6=142(y1), r7=51(x2), r8=192(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=336(x), r11=255(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 51
LDI r1, 147
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 142
LDI r7, 51
LDI r8, 192
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 255
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
