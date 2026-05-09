; DESCRIPTION: Composite: Places a black circle of radius 38 at center (351, 136) then Draws a purple line from (11, 41) to (267, 223).
; PLAN: r0=351(x), r1=136(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x1), r6=41(y1), r7=267(x2), r8=223(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 136
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 41
LDI r7, 267
LDI r8, 223
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
