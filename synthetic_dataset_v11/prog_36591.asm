; DESCRIPTION: Composite: . Then Draws a white line from (185, 142) to (190, 42). Then Sets a single purple pixel at (11, 144).
; PLAN: r0=185(x1), r1=142(y1), r2=190(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=11(x), r1=144(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (185, 142) to (190, 42).
; PLAN: r0=185(x1), r1=142(y1), r2=190(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 142
LDI r2, 190
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (11, 144).
; PLAN: r0=11(x), r1=144(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 144
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
