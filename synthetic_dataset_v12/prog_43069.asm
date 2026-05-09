; DESCRIPTION: Composite: Places a purple line segment connecting (486, 25) to (70, 39) then Renders a red disk with center (221, 155) and radius 31.
; PLAN: r0=486(x1), r1=25(y1), r2=70(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=155(y), r7=31(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 486
LDI r1, 25
LDI r2, 70
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 155
LDI r7, 31
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
