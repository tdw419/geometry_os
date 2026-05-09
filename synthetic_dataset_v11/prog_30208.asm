; DESCRIPTION: Places a red line segment connecting (232, 47) to (164, 71).
; PLAN: r0=232(x1), r1=47(y1), r2=164(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 47
LDI r2, 164
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
