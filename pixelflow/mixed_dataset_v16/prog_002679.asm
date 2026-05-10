; DESCRIPTION: Composite: Places a purple line segment connecting (86, 76) to (48, 183) then Renders a cyan disk with center (318, 92) and radius 69.
; PLAN: r0=86(x1), r1=76(y1), r2=48(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=92(y), r7=69(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 86
LDI r1, 76
LDI r2, 48
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 92
LDI r7, 69
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
