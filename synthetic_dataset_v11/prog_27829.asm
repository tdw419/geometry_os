; DESCRIPTION: Composite: . Then Places a red line segment connecting (187, 112) to (202, 199). Then Places a purple dot at position (211, 114).
; PLAN: r0=187(x1), r1=112(y1), r2=202(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=211(x), r1=114(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (187, 112) to (202, 199).
; PLAN: r0=187(x1), r1=112(y1), r2=202(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 112
LDI r2, 202
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (211, 114).
; PLAN: r0=211(x), r1=114(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 114
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
