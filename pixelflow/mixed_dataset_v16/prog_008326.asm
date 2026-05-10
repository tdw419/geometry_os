; DESCRIPTION: Composite: Places a black line segment connecting (471, 241) to (134, 51) then Renders a blue disk with center (207, 56) and radius 10.
; PLAN: r0=471(x1), r1=241(y1), r2=134(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=56(y), r7=10(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 471
LDI r1, 241
LDI r2, 134
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 56
LDI r7, 10
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
