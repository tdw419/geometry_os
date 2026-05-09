; DESCRIPTION: Composite: . Then Draws a white line from (11, 127) to (129, 116). Then Sets a single purple pixel at (68, 71).
; PLAN: r0=11(x1), r1=127(y1), r2=129(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=68(x), r1=71(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (11, 127) to (129, 116).
; PLAN: r0=11(x1), r1=127(y1), r2=129(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 127
LDI r2, 129
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (68, 71).
; PLAN: r0=68(x), r1=71(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 71
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
