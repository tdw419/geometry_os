; DESCRIPTION: Composite: . Then Sets a single white pixel at (20, 144). Then Places a purple line segment connecting (199, 76) to (122, 191).
; PLAN: r0=20(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=199(x1), r1=76(y1), r2=122(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (20, 144).
; PLAN: r0=20(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 144
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a purple line segment connecting (199, 76) to (122, 191).
; PLAN: r0=199(x1), r1=76(y1), r2=122(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 76
LDI r2, 122
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
