; DESCRIPTION: Composite: . Then Renders a purple line between points (115, 9) and (168, 40). Then Sets a single white pixel at (98, 5).
; PLAN: r0=115(x1), r1=9(y1), r2=168(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=98(x), r1=5(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple line between points (115, 9) and (168, 40).
; PLAN: r0=115(x1), r1=9(y1), r2=168(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 9
LDI r2, 168
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (98, 5).
; PLAN: r0=98(x), r1=5(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 98
LDI r1, 5
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
