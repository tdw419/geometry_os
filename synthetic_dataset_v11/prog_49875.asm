; DESCRIPTION: Composite: . Then Renders a magenta line between points (155, 188) and (36, 83). Then Sets a single purple pixel at (82, 115).
; PLAN: r0=155(x1), r1=188(y1), r2=36(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=82(x), r1=115(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (155, 188) and (36, 83).
; PLAN: r0=155(x1), r1=188(y1), r2=36(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 188
LDI r2, 36
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (82, 115).
; PLAN: r0=82(x), r1=115(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 115
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
