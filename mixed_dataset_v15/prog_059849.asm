; DESCRIPTION: Composite: Places a white circle of radius 14 at center (98, 49) then Sets a single white pixel at (302, 80) then Renders a white line between points (377, 153) and (358, 129).
; PLAN: r0=98(x), r1=49(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x), r6=80(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=377(x1), r11=153(y1), r12=358(x2), r13=129(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 49
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 80
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 377
LDI r11, 153
LDI r12, 358
LDI r13, 129
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
