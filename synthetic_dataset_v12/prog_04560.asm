; DESCRIPTION: Composite: Places a white line segment connecting (407, 142) to (174, 169) then Renders a purple disk with center (234, 143) and radius 78.
; PLAN: r0=407(x1), r1=142(y1), r2=174(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=143(y), r7=78(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 407
LDI r1, 142
LDI r2, 174
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 143
LDI r7, 78
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
