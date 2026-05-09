; DESCRIPTION: Composite: . Then Sets a single black pixel at (102, 137). Then Renders a yellow line between points (183, 106) and (35, 194).
; PLAN: r0=102(x), r1=137(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=183(x1), r1=106(y1), r2=35(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (102, 137).
; PLAN: r0=102(x), r1=137(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 137
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow line between points (183, 106) and (35, 194).
; PLAN: r0=183(x1), r1=106(y1), r2=35(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 106
LDI r2, 35
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
