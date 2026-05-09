; DESCRIPTION: Composite: . Then Renders a white line between points (249, 248) and (151, 221). Then Sets a single magenta pixel at (53, 52).
; PLAN: r0=249(x1), r1=248(y1), r2=151(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=53(x), r1=52(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white line between points (249, 248) and (151, 221).
; PLAN: r0=249(x1), r1=248(y1), r2=151(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 248
LDI r2, 151
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (53, 52).
; PLAN: r0=53(x), r1=52(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 52
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
