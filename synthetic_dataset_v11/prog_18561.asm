; DESCRIPTION: Composite: . Then Sets a single blue pixel at (231, 149). Then Renders a black line between points (236, 31) and (163, 218).
; PLAN: r0=231(x), r1=149(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=236(x1), r1=31(y1), r2=163(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (231, 149).
; PLAN: r0=231(x), r1=149(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 149
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a black line between points (236, 31) and (163, 218).
; PLAN: r0=236(x1), r1=31(y1), r2=163(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 31
LDI r2, 163
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
