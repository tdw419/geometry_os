; DESCRIPTION: Composite: . Then Places a purple dot at position (41, 178). Then Places a purple line segment connecting (71, 52) to (202, 189).
; PLAN: r0=41(x), r1=178(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=71(x1), r1=52(y1), r2=202(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (41, 178).
; PLAN: r0=41(x), r1=178(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 178
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a purple line segment connecting (71, 52) to (202, 189).
; PLAN: r0=71(x1), r1=52(y1), r2=202(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 52
LDI r2, 202
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
