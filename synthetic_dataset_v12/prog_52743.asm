; DESCRIPTION: Composite: Places a yellow line segment connecting (429, 9) to (270, 159) then Renders a white disk with center (323, 129) and radius 80.
; PLAN: r0=429(x1), r1=9(y1), r2=270(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=323(x), r6=129(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 429
LDI r1, 9
LDI r2, 270
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 129
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
