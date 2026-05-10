; DESCRIPTION: Composite: Renders a green disk with center (265, 156) and radius 52 then Places a orange line segment connecting (435, 160) to (142, 208).
; PLAN: r0=265(x), r1=156(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x1), r6=160(y1), r7=142(x2), r8=208(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 156
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 160
LDI r7, 142
LDI r8, 208
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
