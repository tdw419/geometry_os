; DESCRIPTION: Composite: . Then Sets a single blue pixel at (79, 121). Then Places a yellow line segment connecting (25, 16) to (75, 194).
; PLAN: r0=79(x), r1=121(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=25(x1), r1=16(y1), r2=75(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (79, 121).
; PLAN: r0=79(x), r1=121(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 121
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (25, 16) to (75, 194).
; PLAN: r0=25(x1), r1=16(y1), r2=75(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 16
LDI r2, 75
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
