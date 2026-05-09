; DESCRIPTION: Composite: . Then Sets a single purple pixel at (113, 3). Then Renders a red line between points (220, 27) and (11, 179).
; PLAN: r0=113(x), r1=3(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=220(x1), r1=27(y1), r2=11(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (113, 3).
; PLAN: r0=113(x), r1=3(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 3
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (220, 27) and (11, 179).
; PLAN: r0=220(x1), r1=27(y1), r2=11(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 27
LDI r2, 11
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
