; DESCRIPTION: Composite: . Then Renders a green disk with center (201, 131) and radius 42. Then Draws a purple line from (66, 8) to (141, 203).
; PLAN: r0=201(x), r1=131(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=66(x1), r1=8(y1), r2=141(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (201, 131) and radius 42.
; PLAN: r0=201(x), r1=131(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 131
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (66, 8) to (141, 203).
; PLAN: r0=66(x1), r1=8(y1), r2=141(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 8
LDI r2, 141
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
