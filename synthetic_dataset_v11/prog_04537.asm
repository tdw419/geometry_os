; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (60, 153). Then Places a purple line segment connecting (35, 14) to (179, 15).
; PLAN: r0=60(x), r1=153(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=35(x1), r1=14(y1), r2=179(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (60, 153).
; PLAN: r0=60(x), r1=153(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 153
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a purple line segment connecting (35, 14) to (179, 15).
; PLAN: r0=35(x1), r1=14(y1), r2=179(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 14
LDI r2, 179
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
