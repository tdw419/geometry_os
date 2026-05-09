; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (53, 196). Then Draws a purple line from (94, 244) to (123, 252).
; PLAN: r0=53(x), r1=196(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=94(x1), r1=244(y1), r2=123(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (53, 196).
; PLAN: r0=53(x), r1=196(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 196
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (94, 244) to (123, 252).
; PLAN: r0=94(x1), r1=244(y1), r2=123(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 244
LDI r2, 123
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
