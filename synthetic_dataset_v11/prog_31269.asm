; DESCRIPTION: Composite: . Then Renders a purple line between points (120, 184) and (122, 243). Then Sets a single purple pixel at (77, 193).
; PLAN: r0=120(x1), r1=184(y1), r2=122(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=77(x), r1=193(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple line between points (120, 184) and (122, 243).
; PLAN: r0=120(x1), r1=184(y1), r2=122(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 184
LDI r2, 122
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (77, 193).
; PLAN: r0=77(x), r1=193(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 193
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
