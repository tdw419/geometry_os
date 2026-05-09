; DESCRIPTION: Composite: . Then Sets a single purple pixel at (178, 18). Then Draws a purple line from (156, 57) to (140, 173).
; PLAN: r0=178(x), r1=18(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=156(x1), r1=57(y1), r2=140(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (178, 18).
; PLAN: r0=178(x), r1=18(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 18
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (156, 57) to (140, 173).
; PLAN: r0=156(x1), r1=57(y1), r2=140(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 57
LDI r2, 140
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
