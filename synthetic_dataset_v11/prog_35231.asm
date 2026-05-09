; DESCRIPTION: Composite: . Then Draws a purple line from (17, 158) to (215, 218). Then Sets a single purple pixel at (197, 251).
; PLAN: r0=17(x1), r1=158(y1), r2=215(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=197(x), r1=251(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (17, 158) to (215, 218).
; PLAN: r0=17(x1), r1=158(y1), r2=215(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 158
LDI r2, 215
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (197, 251).
; PLAN: r0=197(x), r1=251(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 251
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
