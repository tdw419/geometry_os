; DESCRIPTION: Composite: . Then Sets a single red pixel at (51, 214). Then Places a magenta line segment connecting (1, 252) to (204, 8).
; PLAN: r0=51(x), r1=214(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=1(x1), r1=252(y1), r2=204(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (51, 214).
; PLAN: r0=51(x), r1=214(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 214
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a magenta line segment connecting (1, 252) to (204, 8).
; PLAN: r0=1(x1), r1=252(y1), r2=204(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 252
LDI r2, 204
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
