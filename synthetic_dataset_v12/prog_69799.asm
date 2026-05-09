; DESCRIPTION: Composite: Places a red line segment connecting (1, 103) to (507, 44) then Renders a purple disk with center (396, 53) and radius 14.
; PLAN: r0=1(x1), r1=103(y1), r2=507(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=53(y), r7=14(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 1
LDI r1, 103
LDI r2, 507
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 53
LDI r7, 14
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
