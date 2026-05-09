; DESCRIPTION: Composite: . Then Renders a magenta line between points (118, 18) and (195, 252). Then Sets a single yellow pixel at (180, 197).
; PLAN: r0=118(x1), r1=18(y1), r2=195(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=180(x), r1=197(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (118, 18) and (195, 252).
; PLAN: r0=118(x1), r1=18(y1), r2=195(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 18
LDI r2, 195
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (180, 197).
; PLAN: r0=180(x), r1=197(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 197
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
