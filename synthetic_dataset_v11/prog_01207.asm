; DESCRIPTION: Composite: . Then Draws a blue line from (52, 215) to (158, 163). Then Sets a single orange pixel at (36, 200).
; PLAN: r0=52(x1), r1=215(y1), r2=158(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=36(x), r1=200(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue line from (52, 215) to (158, 163).
; PLAN: r0=52(x1), r1=215(y1), r2=158(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 215
LDI r2, 158
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (36, 200).
; PLAN: r0=36(x), r1=200(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 200
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
