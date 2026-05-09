; DESCRIPTION: Composite: . Then Renders a magenta line between points (19, 49) and (17, 246). Then Creates a blue circular shape at (100, 106) with radius 80.
; PLAN: r0=19(x1), r1=49(y1), r2=17(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=100(x), r1=106(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta line between points (19, 49) and (17, 246).
; PLAN: r0=19(x1), r1=49(y1), r2=17(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 49
LDI r2, 17
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (100, 106) with radius 80.
; PLAN: r0=100(x), r1=106(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 106
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
