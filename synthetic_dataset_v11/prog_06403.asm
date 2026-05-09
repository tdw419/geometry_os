; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (129, 147) to (78, 149). Then Sets a single white pixel at (199, 181).
; PLAN: r0=129(x1), r1=147(y1), r2=78(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=199(x), r1=181(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (129, 147) to (78, 149).
; PLAN: r0=129(x1), r1=147(y1), r2=78(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 147
LDI r2, 78
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (199, 181).
; PLAN: r0=199(x), r1=181(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 199
LDI r1, 181
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
