; DESCRIPTION: Composite: . Then Places a green line segment connecting (153, 196) to (119, 254). Then Renders a red disk with center (77, 155) and radius 35.
; PLAN: r0=153(x1), r1=196(y1), r2=119(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=77(x), r1=155(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (153, 196) to (119, 254).
; PLAN: r0=153(x1), r1=196(y1), r2=119(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 196
LDI r2, 119
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (77, 155) and radius 35.
; PLAN: r0=77(x), r1=155(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 155
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
