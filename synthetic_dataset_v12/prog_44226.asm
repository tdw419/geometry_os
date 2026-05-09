; DESCRIPTION: Composite: Renders a red line between points (142, 88) and (373, 227) then Draws a green circle centered at (104, 143) with radius 39.
; PLAN: r0=142(x1), r1=88(y1), r2=373(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=143(y), r7=39(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 142
LDI r1, 88
LDI r2, 373
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 143
LDI r7, 39
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
