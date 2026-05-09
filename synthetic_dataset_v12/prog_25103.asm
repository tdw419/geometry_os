; DESCRIPTION: Composite: Creates a blue circular shape at (273, 78) with radius 51 then Places a purple line segment connecting (422, 164) to (208, 202).
; PLAN: r0=273(x), r1=78(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x1), r6=164(y1), r7=208(x2), r8=202(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 78
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 164
LDI r7, 208
LDI r8, 202
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
