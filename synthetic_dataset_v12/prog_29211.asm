; DESCRIPTION: Composite: Renders a yellow line between points (163, 114) and (290, 115) then Renders a blue disk with center (360, 68) and radius 51.
; PLAN: r0=163(x1), r1=114(y1), r2=290(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=360(x), r6=68(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 163
LDI r1, 114
LDI r2, 290
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 68
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
