; DESCRIPTION: Composite: . Then Sets a single black pixel at (167, 11). Then Places a blue line segment connecting (191, 51) to (41, 153).
; PLAN: r0=167(x), r1=11(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=191(x1), r1=51(y1), r2=41(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (167, 11).
; PLAN: r0=167(x), r1=11(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 11
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a blue line segment connecting (191, 51) to (41, 153).
; PLAN: r0=191(x1), r1=51(y1), r2=41(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 51
LDI r2, 41
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
