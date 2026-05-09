; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (199, 126) with radius 45. Then Draws a magenta line from (136, 225) to (115, 145).
; PLAN: r0=199(x), r1=126(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=136(x1), r1=225(y1), r2=115(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (199, 126) with radius 45.
; PLAN: r0=199(x), r1=126(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 126
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta line from (136, 225) to (115, 145).
; PLAN: r0=136(x1), r1=225(y1), r2=115(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 225
LDI r2, 115
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
