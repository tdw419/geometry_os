; DESCRIPTION: Places a magenta line segment connecting (265, 35) to (41, 80).
; PLAN: r0=265(x1), r1=35(y1), r2=41(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 35
LDI r2, 41
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
