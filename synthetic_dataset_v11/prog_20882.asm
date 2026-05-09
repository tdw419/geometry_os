; DESCRIPTION: Composite: . Then Places a black circle of radius 69 at center (92, 80). Then Draws a magenta line from (139, 211) to (201, 74).
; PLAN: r0=92(x), r1=80(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=139(x1), r1=211(y1), r2=201(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 69 at center (92, 80).
; PLAN: r0=92(x), r1=80(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 80
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta line from (139, 211) to (201, 74).
; PLAN: r0=139(x1), r1=211(y1), r2=201(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 211
LDI r2, 201
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
