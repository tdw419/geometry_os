; DESCRIPTION: Composite: . Then Sets a single blue pixel at (81, 156). Then Renders a green line between points (137, 2) and (231, 0).
; PLAN: r0=81(x), r1=156(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=137(x1), r1=2(y1), r2=231(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (81, 156).
; PLAN: r0=81(x), r1=156(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 156
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a green line between points (137, 2) and (231, 0).
; PLAN: r0=137(x1), r1=2(y1), r2=231(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 2
LDI r2, 231
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
