; DESCRIPTION: Composite: . Then Sets a single blue pixel at (115, 76). Then Places a green line segment connecting (146, 97) to (231, 140).
; PLAN: r0=115(x), r1=76(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=146(x1), r1=97(y1), r2=231(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (115, 76).
; PLAN: r0=115(x), r1=76(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 115
LDI r1, 76
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a green line segment connecting (146, 97) to (231, 140).
; PLAN: r0=146(x1), r1=97(y1), r2=231(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 97
LDI r2, 231
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
