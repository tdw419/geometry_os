; DESCRIPTION: Composite: Renders a green line between points (12, 62) and (98, 103) then Renders a black disk with center (227, 178) and radius 34.
; PLAN: r0=12(x1), r1=62(y1), r2=98(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=178(y), r7=34(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 62
LDI r2, 98
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 178
LDI r7, 34
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
