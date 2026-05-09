; DESCRIPTION: Composite: . Then Sets a single purple pixel at (14, 110). Then Draws a orange line from (196, 131) to (220, 143).
; PLAN: r0=14(x), r1=110(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=196(x1), r1=131(y1), r2=220(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (14, 110).
; PLAN: r0=14(x), r1=110(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 110
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange line from (196, 131) to (220, 143).
; PLAN: r0=196(x1), r1=131(y1), r2=220(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 131
LDI r2, 220
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
