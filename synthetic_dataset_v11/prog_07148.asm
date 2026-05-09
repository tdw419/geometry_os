; DESCRIPTION: Composite: . Then Places a blue dot at position (41, 227). Then Places a yellow line segment connecting (143, 216) to (47, 68).
; PLAN: r0=41(x), r1=227(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=143(x1), r1=216(y1), r2=47(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (41, 227).
; PLAN: r0=41(x), r1=227(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 227
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (143, 216) to (47, 68).
; PLAN: r0=143(x1), r1=216(y1), r2=47(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 216
LDI r2, 47
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
