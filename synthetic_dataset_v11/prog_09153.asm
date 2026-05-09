; DESCRIPTION: Composite: . Then Draws a white line from (111, 194) to (111, 17). Then Sets a single green pixel at (247, 201).
; PLAN: r0=111(x1), r1=194(y1), r2=111(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=247(x), r1=201(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (111, 194) to (111, 17).
; PLAN: r0=111(x1), r1=194(y1), r2=111(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 194
LDI r2, 111
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (247, 201).
; PLAN: r0=247(x), r1=201(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 201
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
