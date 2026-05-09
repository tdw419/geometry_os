; DESCRIPTION: Composite: Draws a purple circle centered at (54, 150) with radius 41 then Renders a green line between points (155, 141) and (341, 241).
; PLAN: r0=54(x), r1=150(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x1), r6=141(y1), r7=341(x2), r8=241(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 54
LDI r1, 150
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 141
LDI r7, 341
LDI r8, 241
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
