; DESCRIPTION: Composite: . Then Renders a green line between points (133, 79) and (118, 33). Then Sets a single purple pixel at (47, 133).
; PLAN: r0=133(x1), r1=79(y1), r2=118(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=47(x), r1=133(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green line between points (133, 79) and (118, 33).
; PLAN: r0=133(x1), r1=79(y1), r2=118(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 79
LDI r2, 118
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (47, 133).
; PLAN: r0=47(x), r1=133(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 47
LDI r1, 133
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
