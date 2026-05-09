; DESCRIPTION: Places a red line segment connecting (117, 238) to (47, 66).
; PLAN: r0=117(x1), r1=238(y1), r2=47(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 238
LDI r2, 47
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
