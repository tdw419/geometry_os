; DESCRIPTION: Composite: Places a blue line segment connecting (155, 149) to (163, 110) then Places a orange circle of radius 14 at center (38, 222).
; PLAN: r0=155(x1), r1=149(y1), r2=163(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=222(y), r7=14(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 155
LDI r1, 149
LDI r2, 163
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 222
LDI r7, 14
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
