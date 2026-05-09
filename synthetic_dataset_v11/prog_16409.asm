; DESCRIPTION: Composite: . Then Renders a yellow disk with center (166, 128) and radius 38. Then Renders a purple line between points (145, 168) and (80, 70).
; PLAN: r0=166(x), r1=128(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=145(x1), r1=168(y1), r2=80(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (166, 128) and radius 38.
; PLAN: r0=166(x), r1=128(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 128
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (145, 168) and (80, 70).
; PLAN: r0=145(x1), r1=168(y1), r2=80(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 168
LDI r2, 80
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
