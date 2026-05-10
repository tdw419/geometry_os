; DESCRIPTION: Composite: Renders a purple disk with center (145, 55) and radius 12 then Places a yellow line segment connecting (383, 178) to (163, 30).
; PLAN: r0=145(x), r1=55(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x1), r6=178(y1), r7=163(x2), r8=30(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 55
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 178
LDI r7, 163
LDI r8, 30
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
