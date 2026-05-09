; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (161, 172) to (248, 150). Then Draws a magenta circle centered at (216, 29) with radius 13.
; PLAN: r0=161(x1), r1=172(y1), r2=248(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=216(x), r1=29(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta line segment connecting (161, 172) to (248, 150).
; PLAN: r0=161(x1), r1=172(y1), r2=248(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 172
LDI r2, 248
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (216, 29) with radius 13.
; PLAN: r0=216(x), r1=29(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 29
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
