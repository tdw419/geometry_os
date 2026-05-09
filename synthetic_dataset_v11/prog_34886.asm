; DESCRIPTION: Composite: . Then Places a green circle of radius 50 at center (203, 123). Then Renders a white line between points (144, 155) and (169, 118).
; PLAN: r0=203(x), r1=123(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=144(x1), r1=155(y1), r2=169(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 50 at center (203, 123).
; PLAN: r0=203(x), r1=123(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 123
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (144, 155) and (169, 118).
; PLAN: r0=144(x1), r1=155(y1), r2=169(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 155
LDI r2, 169
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
