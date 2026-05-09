; DESCRIPTION: Composite: . Then Sets a single white pixel at (109, 34). Then Renders a blue line between points (9, 251) and (171, 139).
; PLAN: r0=109(x), r1=34(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=9(x1), r1=251(y1), r2=171(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (109, 34).
; PLAN: r0=109(x), r1=34(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 34
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (9, 251) and (171, 139).
; PLAN: r0=9(x1), r1=251(y1), r2=171(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 251
LDI r2, 171
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
