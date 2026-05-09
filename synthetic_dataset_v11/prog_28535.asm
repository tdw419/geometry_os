; DESCRIPTION: Composite: . Then Places a purple dot at position (3, 40). Then Renders a white line between points (63, 177) and (171, 226).
; PLAN: r0=3(x), r1=40(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=63(x1), r1=177(y1), r2=171(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (3, 40).
; PLAN: r0=3(x), r1=40(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 40
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a white line between points (63, 177) and (171, 226).
; PLAN: r0=63(x1), r1=177(y1), r2=171(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 177
LDI r2, 171
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
