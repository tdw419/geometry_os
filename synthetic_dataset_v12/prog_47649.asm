; DESCRIPTION: Composite: Places a purple line segment connecting (24, 201) to (213, 167) then Places a white circle of radius 11 at center (450, 128).
; PLAN: r0=24(x1), r1=201(y1), r2=213(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=128(y), r7=11(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 24
LDI r1, 201
LDI r2, 213
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 128
LDI r7, 11
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
