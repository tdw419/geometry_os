; DESCRIPTION: Composite: . Then Places a blue line segment connecting (75, 217) to (216, 252). Then Sets a single red pixel at (215, 82).
; PLAN: r0=75(x1), r1=217(y1), r2=216(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=215(x), r1=82(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue line segment connecting (75, 217) to (216, 252).
; PLAN: r0=75(x1), r1=217(y1), r2=216(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 217
LDI r2, 216
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (215, 82).
; PLAN: r0=215(x), r1=82(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 82
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
