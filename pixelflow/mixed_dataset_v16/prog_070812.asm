; DESCRIPTION: Composite: Places a purple line segment connecting (159, 78) to (159, 180) then Places a green circle of radius 13 at center (262, 105).
; PLAN: r0=159(x1), r1=78(y1), r2=159(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=105(y), r7=13(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 159
LDI r1, 78
LDI r2, 159
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 105
LDI r7, 13
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
