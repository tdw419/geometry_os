; DESCRIPTION: Composite: . Then Renders a white line between points (170, 18) and (248, 240). Then Sets a single purple pixel at (151, 48).
; PLAN: r0=170(x1), r1=18(y1), r2=248(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=151(x), r1=48(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white line between points (170, 18) and (248, 240).
; PLAN: r0=170(x1), r1=18(y1), r2=248(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 18
LDI r2, 248
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (151, 48).
; PLAN: r0=151(x), r1=48(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 48
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
