; DESCRIPTION: Composite: . Then Places a purple line segment connecting (133, 69) to (60, 0). Then Renders a yellow disk with center (107, 67) and radius 43.
; PLAN: r0=133(x1), r1=69(y1), r2=60(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=107(x), r1=67(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (133, 69) to (60, 0).
; PLAN: r0=133(x1), r1=69(y1), r2=60(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 69
LDI r2, 60
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (107, 67) and radius 43.
; PLAN: r0=107(x), r1=67(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 67
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
