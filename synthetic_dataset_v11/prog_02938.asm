; DESCRIPTION: Composite: . Then Sets a single blue pixel at (221, 122). Then Renders a white line between points (89, 177) and (121, 121).
; PLAN: r0=221(x), r1=122(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=89(x1), r1=177(y1), r2=121(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (221, 122).
; PLAN: r0=221(x), r1=122(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 122
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a white line between points (89, 177) and (121, 121).
; PLAN: r0=89(x1), r1=177(y1), r2=121(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 177
LDI r2, 121
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
