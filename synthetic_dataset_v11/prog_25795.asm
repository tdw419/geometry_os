; DESCRIPTION: Composite: . Then Draws a cyan line from (56, 155) to (20, 159). Then Sets a single purple pixel at (31, 92).
; PLAN: r0=56(x1), r1=155(y1), r2=20(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=31(x), r1=92(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan line from (56, 155) to (20, 159).
; PLAN: r0=56(x1), r1=155(y1), r2=20(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 155
LDI r2, 20
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (31, 92).
; PLAN: r0=31(x), r1=92(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 92
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
