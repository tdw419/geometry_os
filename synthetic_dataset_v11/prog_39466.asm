; DESCRIPTION: Composite: . Then Renders a white disk with center (131, 75) and radius 44. Then Places a purple line segment connecting (210, 177) to (188, 166).
; PLAN: r0=131(x), r1=75(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=210(x1), r1=177(y1), r2=188(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (131, 75) and radius 44.
; PLAN: r0=131(x), r1=75(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 75
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (210, 177) to (188, 166).
; PLAN: r0=210(x1), r1=177(y1), r2=188(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 177
LDI r2, 188
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
