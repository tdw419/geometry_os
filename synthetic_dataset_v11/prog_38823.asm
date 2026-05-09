; DESCRIPTION: Composite: . Then Places a blue line segment connecting (101, 177) to (252, 108). Then Draws a blue circle centered at (151, 179) with radius 75.
; PLAN: r0=101(x1), r1=177(y1), r2=252(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=151(x), r1=179(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (101, 177) to (252, 108).
; PLAN: r0=101(x1), r1=177(y1), r2=252(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 177
LDI r2, 252
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (151, 179) with radius 75.
; PLAN: r0=151(x), r1=179(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 179
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
