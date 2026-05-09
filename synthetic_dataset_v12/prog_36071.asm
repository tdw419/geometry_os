; DESCRIPTION: Composite: Renders a yellow disk with center (302, 155) and radius 43 then Renders a yellow line between points (269, 30) and (418, 98).
; PLAN: r0=302(x), r1=155(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x1), r6=30(y1), r7=418(x2), r8=98(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 155
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 30
LDI r7, 418
LDI r8, 98
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
