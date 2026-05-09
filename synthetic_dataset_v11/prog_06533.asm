; DESCRIPTION: Composite: . Then Draws a purple line from (102, 120) to (131, 80). Then Sets a single white pixel at (5, 87).
; PLAN: r0=102(x1), r1=120(y1), r2=131(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=5(x), r1=87(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (102, 120) to (131, 80).
; PLAN: r0=102(x1), r1=120(y1), r2=131(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 120
LDI r2, 131
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (5, 87).
; PLAN: r0=5(x), r1=87(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 87
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
