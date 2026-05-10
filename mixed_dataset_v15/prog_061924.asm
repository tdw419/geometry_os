; DESCRIPTION: Composite: Renders a purple disk with center (296, 93) and radius 51 then Renders a orange line between points (209, 155) and (364, 216).
; PLAN: r0=296(x), r1=93(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x1), r6=155(y1), r7=364(x2), r8=216(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 93
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 155
LDI r7, 364
LDI r8, 216
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
