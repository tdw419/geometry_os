; DESCRIPTION: Composite: . Then Renders a red disk with center (119, 172) and radius 64. Then Renders a purple line between points (184, 122) and (208, 135).
; PLAN: r0=119(x), r1=172(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=184(x1), r1=122(y1), r2=208(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (119, 172) and radius 64.
; PLAN: r0=119(x), r1=172(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 172
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (184, 122) and (208, 135).
; PLAN: r0=184(x1), r1=122(y1), r2=208(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 122
LDI r2, 208
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
