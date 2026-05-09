; DESCRIPTION: Composite: . Then Draws a black line from (12, 217) to (44, 190). Then Sets a single blue pixel at (121, 32).
; PLAN: r0=12(x1), r1=217(y1), r2=44(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=121(x), r1=32(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black line from (12, 217) to (44, 190).
; PLAN: r0=12(x1), r1=217(y1), r2=44(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 217
LDI r2, 44
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (121, 32).
; PLAN: r0=121(x), r1=32(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 121
LDI r1, 32
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
