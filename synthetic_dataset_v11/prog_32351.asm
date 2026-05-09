; DESCRIPTION: Composite: . Then Renders a magenta line between points (80, 50) and (233, 244). Then Sets a single blue pixel at (232, 183).
; PLAN: r0=80(x1), r1=50(y1), r2=233(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=232(x), r1=183(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (80, 50) and (233, 244).
; PLAN: r0=80(x1), r1=50(y1), r2=233(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 50
LDI r2, 233
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (232, 183).
; PLAN: r0=232(x), r1=183(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 183
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
