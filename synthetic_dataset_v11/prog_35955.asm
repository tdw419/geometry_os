; DESCRIPTION: Composite: . Then Places a blue line segment connecting (218, 14) to (100, 218). Then Sets a single orange pixel at (29, 66).
; PLAN: r0=218(x1), r1=14(y1), r2=100(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=29(x), r1=66(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue line segment connecting (218, 14) to (100, 218).
; PLAN: r0=218(x1), r1=14(y1), r2=100(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 14
LDI r2, 100
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (29, 66).
; PLAN: r0=29(x), r1=66(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 66
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
