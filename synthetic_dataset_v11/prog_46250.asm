; DESCRIPTION: Composite: . Then Draws a blue line from (23, 20) to (197, 147). Then Places a purple circle of radius 69 at center (138, 131).
; PLAN: r0=23(x1), r1=20(y1), r2=197(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=138(x), r1=131(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue line from (23, 20) to (197, 147).
; PLAN: r0=23(x1), r1=20(y1), r2=197(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 20
LDI r2, 197
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 69 at center (138, 131).
; PLAN: r0=138(x), r1=131(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 131
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
