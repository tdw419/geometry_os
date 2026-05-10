; DESCRIPTION: Composite: Renders a yellow line between points (409, 99) and (471, 159) then Renders a black disk with center (159, 156) and radius 72.
; PLAN: r0=409(x1), r1=99(y1), r2=471(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=156(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 409
LDI r1, 99
LDI r2, 471
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 156
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
