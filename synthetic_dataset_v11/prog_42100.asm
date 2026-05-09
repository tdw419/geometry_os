; DESCRIPTION: Composite: . Then Places a red dot at position (34, 114). Then Draws a orange line from (81, 156) to (199, 241).
; PLAN: r0=34(x), r1=114(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=81(x1), r1=156(y1), r2=199(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (34, 114).
; PLAN: r0=34(x), r1=114(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 114
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a orange line from (81, 156) to (199, 241).
; PLAN: r0=81(x1), r1=156(y1), r2=199(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 156
LDI r2, 199
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
