; DESCRIPTION: Composite: . Then Sets a single black pixel at (89, 90). Then Places a purple line segment connecting (123, 146) to (161, 204).
; PLAN: r0=89(x), r1=90(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=123(x1), r1=146(y1), r2=161(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (89, 90).
; PLAN: r0=89(x), r1=90(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 90
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a purple line segment connecting (123, 146) to (161, 204).
; PLAN: r0=123(x1), r1=146(y1), r2=161(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 146
LDI r2, 161
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
