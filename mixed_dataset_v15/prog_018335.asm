; DESCRIPTION: Composite: Places a yellow line segment connecting (259, 137) to (132, 150) then Renders a blue disk with center (381, 180) and radius 41.
; PLAN: r0=259(x1), r1=137(y1), r2=132(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=180(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 259
LDI r1, 137
LDI r2, 132
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 180
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
