; DESCRIPTION: Places a red line segment connecting (98, 131) to (500, 114).
; PLAN: r0=98(x1), r1=131(y1), r2=500(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 131
LDI r2, 500
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
