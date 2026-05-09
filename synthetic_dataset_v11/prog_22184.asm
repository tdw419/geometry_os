; DESCRIPTION: Composite: . Then Places a orange line segment connecting (98, 216) to (231, 36). Then Sets a single green pixel at (40, 132).
; PLAN: r0=98(x1), r1=216(y1), r2=231(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=40(x), r1=132(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange line segment connecting (98, 216) to (231, 36).
; PLAN: r0=98(x1), r1=216(y1), r2=231(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 216
LDI r2, 231
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (40, 132).
; PLAN: r0=40(x), r1=132(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 132
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
