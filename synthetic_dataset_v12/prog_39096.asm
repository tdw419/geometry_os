; DESCRIPTION: Composite: Places a blue dot at position (56, 238) then Places a green circle of radius 60 at center (153, 68) then Places a green line segment connecting (189, 240) to (497, 38).
; PLAN: r0=56(x), r1=238(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=153(x), r6=68(y), r7=60(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=189(x1), r11=240(y1), r12=497(x2), r13=38(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 238
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 153
LDI r6, 68
LDI r7, 60
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 189
LDI r11, 240
LDI r12, 497
LDI r13, 38
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
