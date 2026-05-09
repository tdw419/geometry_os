; DESCRIPTION: Places a red line segment connecting (145, 47) to (316, 146).
; PLAN: r0=145(x1), r1=47(y1), r2=316(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 47
LDI r2, 316
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
