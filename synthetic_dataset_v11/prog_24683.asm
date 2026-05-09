; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (235, 83) to (51, 78). Then Places a red dot at position (116, 9).
; PLAN: r0=235(x1), r1=83(y1), r2=51(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=116(x), r1=9(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (235, 83) to (51, 78).
; PLAN: r0=235(x1), r1=83(y1), r2=51(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 83
LDI r2, 51
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (116, 9).
; PLAN: r0=116(x), r1=9(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 116
LDI r1, 9
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
