; DESCRIPTION: Draws a orange line from (89, 131) to (31, 95).
; PLAN: r0=89(x1), r1=131(y1), r2=31(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 131
LDI r2, 31
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
