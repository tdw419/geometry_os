; DESCRIPTION: Places a cyan line segment connecting (252, 118) to (496, 163).
; PLAN: r0=252(x1), r1=118(y1), r2=496(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 118
LDI r2, 496
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
