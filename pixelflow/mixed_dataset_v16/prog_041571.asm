; DESCRIPTION: Composite: Draws a red line from (163, 140) to (5, 165) then Renders a black disk with center (336, 129) and radius 79.
; PLAN: r0=163(x1), r1=140(y1), r2=5(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=129(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 163
LDI r1, 140
LDI r2, 5
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 129
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
