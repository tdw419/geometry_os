; DESCRIPTION: Composite: Sets a single green pixel at (6, 201) then Draws a purple circle centered at (308, 159) with radius 65 then Renders a red line between points (238, 176) and (336, 203).
; PLAN: r0=6(x), r1=201(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=159(y), r7=65(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=238(x1), r11=176(y1), r12=336(x2), r13=203(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 6
LDI r1, 201
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 308
LDI r6, 159
LDI r7, 65
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 238
LDI r11, 176
LDI r12, 336
LDI r13, 203
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
