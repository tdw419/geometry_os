; DESCRIPTION: Places a red line segment connecting (170, 131) to (164, 47).
; PLAN: r0=170(x1), r1=131(y1), r2=164(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 131
LDI r2, 164
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
