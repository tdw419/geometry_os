; DESCRIPTION: Composite: Renders a orange line between points (64, 19) and (153, 104) then Creates a blue circular shape at (200, 163) with radius 67.
; PLAN: r0=64(x1), r1=19(y1), r2=153(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=163(y), r7=67(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 64
LDI r1, 19
LDI r2, 153
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 163
LDI r7, 67
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
