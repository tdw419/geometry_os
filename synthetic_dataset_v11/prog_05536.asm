; DESCRIPTION: Composite: . Then Draws a purple line from (64, 115) to (233, 63). Then Sets a single yellow pixel at (212, 40).
; PLAN: r0=64(x1), r1=115(y1), r2=233(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=212(x), r1=40(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (64, 115) to (233, 63).
; PLAN: r0=64(x1), r1=115(y1), r2=233(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 115
LDI r2, 233
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (212, 40).
; PLAN: r0=212(x), r1=40(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 40
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
