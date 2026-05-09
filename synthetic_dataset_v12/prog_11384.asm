; DESCRIPTION: Composite: Draws a green circle centered at (44, 231) with radius 20 then Renders a magenta line between points (351, 51) and (369, 230) then Sets a single black pixel at (173, 199).
; PLAN: r0=44(x), r1=231(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=351(x1), r6=51(y1), r7=369(x2), r8=230(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=173(x), r11=199(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 44
LDI r1, 231
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 351
LDI r6, 51
LDI r7, 369
LDI r8, 230
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 199
LDI r12, 0x000000
PSET r10, r11, r12
HALT
