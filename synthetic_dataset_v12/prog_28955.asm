; DESCRIPTION: Composite: Renders a green line between points (24, 246) and (376, 52) then Renders a blue disk with center (218, 227) and radius 25.
; PLAN: r0=24(x1), r1=246(y1), r2=376(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=227(y), r7=25(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 24
LDI r1, 246
LDI r2, 376
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 227
LDI r7, 25
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
