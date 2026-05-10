; DESCRIPTION: Composite: Places a yellow circle of radius 40 at center (131, 43) then Places a purple line segment connecting (145, 12) to (2, 170).
; PLAN: r0=131(x), r1=43(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=145(x1), r6=12(y1), r7=2(x2), r8=170(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 43
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 145
LDI r6, 12
LDI r7, 2
LDI r8, 170
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
