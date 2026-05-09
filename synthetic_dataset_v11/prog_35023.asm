; DESCRIPTION: Composite: . Then Places a red line segment connecting (130, 178) to (141, 203). Then Sets a single orange pixel at (88, 132).
; PLAN: r0=130(x1), r1=178(y1), r2=141(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=88(x), r1=132(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (130, 178) to (141, 203).
; PLAN: r0=130(x1), r1=178(y1), r2=141(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 178
LDI r2, 141
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (88, 132).
; PLAN: r0=88(x), r1=132(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 132
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
