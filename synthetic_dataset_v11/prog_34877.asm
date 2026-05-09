; DESCRIPTION: Composite: . Then Sets a single red pixel at (62, 105). Then Draws a purple line from (101, 208) to (219, 121).
; PLAN: r0=62(x), r1=105(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=101(x1), r1=208(y1), r2=219(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (62, 105).
; PLAN: r0=62(x), r1=105(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 105
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (101, 208) to (219, 121).
; PLAN: r0=101(x1), r1=208(y1), r2=219(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 208
LDI r2, 219
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
