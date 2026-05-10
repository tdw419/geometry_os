; DESCRIPTION: Composite: Places a purple line segment connecting (12, 222) to (15, 77) then Renders a white disk with center (388, 107) and radius 47.
; PLAN: r0=12(x1), r1=222(y1), r2=15(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=107(y), r7=47(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 222
LDI r2, 15
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 107
LDI r7, 47
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
