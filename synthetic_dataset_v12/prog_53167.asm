; DESCRIPTION: Composite: Places a blue line segment connecting (95, 16) to (484, 134) then Draws a red circle centered at (253, 175) with radius 70.
; PLAN: r0=95(x1), r1=16(y1), r2=484(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=175(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 95
LDI r1, 16
LDI r2, 484
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 175
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
