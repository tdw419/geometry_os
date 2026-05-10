; DESCRIPTION: Places a magenta line segment connecting (359, 106) to (93, 41).
; PLAN: r0=359(x1), r1=106(y1), r2=93(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 106
LDI r2, 93
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
