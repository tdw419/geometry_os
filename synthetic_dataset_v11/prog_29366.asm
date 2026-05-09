; DESCRIPTION: Composite: . Then Places a blue line segment connecting (7, 15) to (76, 197). Then Sets a single magenta pixel at (200, 22).
; PLAN: r0=7(x1), r1=15(y1), r2=76(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=200(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue line segment connecting (7, 15) to (76, 197).
; PLAN: r0=7(x1), r1=15(y1), r2=76(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 15
LDI r2, 76
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (200, 22).
; PLAN: r0=200(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 200
LDI r1, 22
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
