; DESCRIPTION: Composite: . Then Draws a white line from (80, 131) to (195, 109). Then Places a purple circle of radius 20 at center (226, 67).
; PLAN: r0=80(x1), r1=131(y1), r2=195(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=226(x), r1=67(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (80, 131) to (195, 109).
; PLAN: r0=80(x1), r1=131(y1), r2=195(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 131
LDI r2, 195
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 20 at center (226, 67).
; PLAN: r0=226(x), r1=67(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 67
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
