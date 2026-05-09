; DESCRIPTION: Composite: . Then Renders a magenta line between points (102, 159) and (89, 46). Then Places a magenta circle of radius 78 at center (104, 161).
; PLAN: r0=102(x1), r1=159(y1), r2=89(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=104(x), r1=161(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta line between points (102, 159) and (89, 46).
; PLAN: r0=102(x1), r1=159(y1), r2=89(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 159
LDI r2, 89
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 78 at center (104, 161).
; PLAN: r0=104(x), r1=161(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 161
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
