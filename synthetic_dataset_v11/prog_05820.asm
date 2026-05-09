; DESCRIPTION: Composite: . Then Draws a blue line from (217, 86) to (148, 60). Then Places a green circle of radius 62 at center (118, 120).
; PLAN: r0=217(x1), r1=86(y1), r2=148(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=118(x), r1=120(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue line from (217, 86) to (148, 60).
; PLAN: r0=217(x1), r1=86(y1), r2=148(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 86
LDI r2, 148
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 62 at center (118, 120).
; PLAN: r0=118(x), r1=120(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 120
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
