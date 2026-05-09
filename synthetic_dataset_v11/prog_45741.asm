; DESCRIPTION: Composite: . Then Sets a single blue pixel at (153, 56). Then Renders a white line between points (17, 172) and (9, 9).
; PLAN: r0=153(x), r1=56(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=17(x1), r1=172(y1), r2=9(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (153, 56).
; PLAN: r0=153(x), r1=56(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 56
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a white line between points (17, 172) and (9, 9).
; PLAN: r0=17(x1), r1=172(y1), r2=9(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 172
LDI r2, 9
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
