; DESCRIPTION: Composite: . Then Sets a single purple pixel at (32, 155). Then Draws a cyan line from (131, 74) to (97, 138).
; PLAN: r0=32(x), r1=155(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=131(x1), r1=74(y1), r2=97(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (32, 155).
; PLAN: r0=32(x), r1=155(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 155
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (131, 74) to (97, 138).
; PLAN: r0=131(x1), r1=74(y1), r2=97(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 74
LDI r2, 97
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
