; DESCRIPTION: Composite: . Then Renders a yellow disk with center (195, 219) and radius 28. Then Renders a black line between points (40, 158) and (133, 208).
; PLAN: r0=195(x), r1=219(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=40(x1), r1=158(y1), r2=133(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (195, 219) and radius 28.
; PLAN: r0=195(x), r1=219(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 219
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (40, 158) and (133, 208).
; PLAN: r0=40(x1), r1=158(y1), r2=133(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 158
LDI r2, 133
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
