; DESCRIPTION: Composite: Places a magenta line segment connecting (84, 208) to (201, 41) then Renders a orange disk with center (325, 192) and radius 50.
; PLAN: r0=84(x1), r1=208(y1), r2=201(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=192(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 84
LDI r1, 208
LDI r2, 201
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 192
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
