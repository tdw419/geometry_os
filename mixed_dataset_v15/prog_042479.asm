; DESCRIPTION: Composite: Draws a green circle centered at (94, 113) with radius 29 then Sets a single purple pixel at (323, 25) then Renders a purple line between points (176, 176) and (443, 223).
; PLAN: r0=94(x), r1=113(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=25(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=176(x1), r11=176(y1), r12=443(x2), r13=223(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 113
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 25
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 176
LDI r11, 176
LDI r12, 443
LDI r13, 223
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
