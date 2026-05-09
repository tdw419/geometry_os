; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (93, 89) to (195, 193). Then Places a red dot at position (67, 166).
; PLAN: r0=93(x1), r1=89(y1), r2=195(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=67(x), r1=166(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (93, 89) to (195, 193).
; PLAN: r0=93(x1), r1=89(y1), r2=195(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 89
LDI r2, 195
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (67, 166).
; PLAN: r0=67(x), r1=166(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 166
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
