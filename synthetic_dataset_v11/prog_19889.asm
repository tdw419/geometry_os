; DESCRIPTION: Composite: . Then Draws a white line from (130, 207) to (13, 49). Then Sets a single blue pixel at (233, 11).
; PLAN: r0=130(x1), r1=207(y1), r2=13(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=233(x), r1=11(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (130, 207) to (13, 49).
; PLAN: r0=130(x1), r1=207(y1), r2=13(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 207
LDI r2, 13
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (233, 11).
; PLAN: r0=233(x), r1=11(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 11
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
