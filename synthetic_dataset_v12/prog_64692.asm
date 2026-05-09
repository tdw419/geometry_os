; DESCRIPTION: Composite: Renders a purple line between points (140, 162) and (356, 30) then Places a purple circle of radius 69 at center (332, 123).
; PLAN: r0=140(x1), r1=162(y1), r2=356(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=123(y), r7=69(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 140
LDI r1, 162
LDI r2, 356
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 123
LDI r7, 69
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
