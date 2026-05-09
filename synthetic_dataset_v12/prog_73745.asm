; DESCRIPTION: Composite: Renders a green line between points (15, 181) and (80, 163) then Renders a purple disk with center (151, 110) and radius 71.
; PLAN: r0=15(x1), r1=181(y1), r2=80(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=110(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 15
LDI r1, 181
LDI r2, 80
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 110
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
