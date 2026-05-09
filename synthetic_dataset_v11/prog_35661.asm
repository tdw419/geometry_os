; DESCRIPTION: Places a orange line segment connecting (246, 89) to (39, 225).
; PLAN: r0=246(x1), r1=89(y1), r2=39(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 89
LDI r2, 39
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
