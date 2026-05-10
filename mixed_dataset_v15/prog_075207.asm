; DESCRIPTION: Composite: Renders a purple line between points (211, 157) and (192, 135) then Renders a yellow disk with center (358, 179) and radius 76.
; PLAN: r0=211(x1), r1=157(y1), r2=192(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=179(y), r7=76(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 211
LDI r1, 157
LDI r2, 192
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 179
LDI r7, 76
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
