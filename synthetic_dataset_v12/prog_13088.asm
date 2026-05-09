; DESCRIPTION: Composite: Renders a orange disk with center (325, 222) and radius 27 then Renders a magenta line between points (141, 77) and (89, 2).
; PLAN: r0=325(x), r1=222(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x1), r6=77(y1), r7=89(x2), r8=2(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 222
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 77
LDI r7, 89
LDI r8, 2
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
