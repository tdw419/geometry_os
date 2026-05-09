; DESCRIPTION: Composite: Places a yellow line segment connecting (282, 131) to (191, 130) then Renders a purple disk with center (301, 193) and radius 60.
; PLAN: r0=282(x1), r1=131(y1), r2=191(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=193(y), r7=60(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 282
LDI r1, 131
LDI r2, 191
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 193
LDI r7, 60
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
