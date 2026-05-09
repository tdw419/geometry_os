; DESCRIPTION: Composite: Places a blue line segment connecting (292, 119) to (155, 119) then Places a blue circle of radius 61 at center (168, 145).
; PLAN: r0=292(x1), r1=119(y1), r2=155(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=145(y), r7=61(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 292
LDI r1, 119
LDI r2, 155
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 145
LDI r7, 61
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
