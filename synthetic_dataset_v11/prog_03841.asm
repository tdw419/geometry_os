; DESCRIPTION: Composite: . Then Places a blue line segment connecting (158, 233) to (234, 212). Then Sets a single red pixel at (171, 131).
; PLAN: r0=158(x1), r1=233(y1), r2=234(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=171(x), r1=131(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue line segment connecting (158, 233) to (234, 212).
; PLAN: r0=158(x1), r1=233(y1), r2=234(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 233
LDI r2, 234
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (171, 131).
; PLAN: r0=171(x), r1=131(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 131
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
