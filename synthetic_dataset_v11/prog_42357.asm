; DESCRIPTION: Composite: . Then Draws a white line from (20, 190) to (21, 136). Then Sets a single blue pixel at (75, 77).
; PLAN: r0=20(x1), r1=190(y1), r2=21(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=75(x), r1=77(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (20, 190) to (21, 136).
; PLAN: r0=20(x1), r1=190(y1), r2=21(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 190
LDI r2, 21
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (75, 77).
; PLAN: r0=75(x), r1=77(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 77
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
