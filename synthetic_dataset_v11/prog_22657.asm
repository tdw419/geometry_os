; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (155, 166) to (3, 101). Then Sets a single yellow pixel at (179, 66).
; PLAN: r0=155(x1), r1=166(y1), r2=3(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=179(x), r1=66(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (155, 166) to (3, 101).
; PLAN: r0=155(x1), r1=166(y1), r2=3(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 166
LDI r2, 3
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (179, 66).
; PLAN: r0=179(x), r1=66(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 66
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
