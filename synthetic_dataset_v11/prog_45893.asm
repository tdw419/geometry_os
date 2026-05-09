; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (193, 51) with radius 38. Then Places a blue line segment connecting (41, 156) to (141, 77).
; PLAN: r0=193(x), r1=51(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=41(x1), r1=156(y1), r2=141(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (193, 51) with radius 38.
; PLAN: r0=193(x), r1=51(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 51
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue line segment connecting (41, 156) to (141, 77).
; PLAN: r0=41(x1), r1=156(y1), r2=141(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 156
LDI r2, 141
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
