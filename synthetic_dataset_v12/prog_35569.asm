; DESCRIPTION: Composite: Renders a black line between points (304, 70) and (176, 112) then Creates a white circular shape at (217, 136) with radius 70.
; PLAN: r0=304(x1), r1=70(y1), r2=176(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=136(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 304
LDI r1, 70
LDI r2, 176
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 136
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
