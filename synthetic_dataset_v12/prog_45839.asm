; DESCRIPTION: Composite: Places a blue line segment connecting (412, 203) to (20, 112) then Places a white circle of radius 48 at center (425, 201).
; PLAN: r0=412(x1), r1=203(y1), r2=20(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=201(y), r7=48(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 412
LDI r1, 203
LDI r2, 20
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 201
LDI r7, 48
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
