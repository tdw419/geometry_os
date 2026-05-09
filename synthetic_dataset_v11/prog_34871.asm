; DESCRIPTION: Composite: . Then Renders a white line between points (105, 54) and (17, 139). Then Sets a single black pixel at (60, 208).
; PLAN: r0=105(x1), r1=54(y1), r2=17(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=60(x), r1=208(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white line between points (105, 54) and (17, 139).
; PLAN: r0=105(x1), r1=54(y1), r2=17(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 54
LDI r2, 17
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (60, 208).
; PLAN: r0=60(x), r1=208(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 208
LDI r2, 0x000000
PSET r0, r1, r2
HALT
