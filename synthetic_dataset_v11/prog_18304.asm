; DESCRIPTION: Composite: . Then Places a black circle of radius 13 at center (113, 130). Then Draws a blue line from (185, 183) to (202, 44).
; PLAN: r0=113(x), r1=130(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=185(x1), r1=183(y1), r2=202(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 13 at center (113, 130).
; PLAN: r0=113(x), r1=130(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 130
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (185, 183) to (202, 44).
; PLAN: r0=185(x1), r1=183(y1), r2=202(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 183
LDI r2, 202
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
