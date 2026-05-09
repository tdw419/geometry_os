; DESCRIPTION: Composite: Renders a green disk with center (309, 163) and radius 34 then Places a black line segment connecting (89, 76) to (481, 191).
; PLAN: r0=309(x), r1=163(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x1), r6=76(y1), r7=481(x2), r8=191(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 163
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 76
LDI r7, 481
LDI r8, 191
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
