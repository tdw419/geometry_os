; DESCRIPTION: Composite: . Then Places a black dot at position (163, 246). Then Places a orange line segment connecting (152, 157) to (155, 158).
; PLAN: r0=163(x), r1=246(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=152(x1), r1=157(y1), r2=155(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (163, 246).
; PLAN: r0=163(x), r1=246(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 246
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a orange line segment connecting (152, 157) to (155, 158).
; PLAN: r0=152(x1), r1=157(y1), r2=155(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 157
LDI r2, 155
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
