; DESCRIPTION: Composite: . Then Places a orange line segment connecting (168, 190) to (14, 206). Then Sets a single blue pixel at (153, 93).
; PLAN: r0=168(x1), r1=190(y1), r2=14(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=153(x), r1=93(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange line segment connecting (168, 190) to (14, 206).
; PLAN: r0=168(x1), r1=190(y1), r2=14(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 190
LDI r2, 14
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (153, 93).
; PLAN: r0=153(x), r1=93(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 93
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
