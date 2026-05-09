; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (57, 41). Then Places a yellow line segment connecting (231, 55) to (77, 93).
; PLAN: r0=57(x), r1=41(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=231(x1), r1=55(y1), r2=77(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (57, 41).
; PLAN: r0=57(x), r1=41(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 41
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (231, 55) to (77, 93).
; PLAN: r0=231(x1), r1=55(y1), r2=77(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 55
LDI r2, 77
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
