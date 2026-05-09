; DESCRIPTION: Places a red line segment connecting (169, 79) to (103, 190).
; PLAN: r0=169(x1), r1=79(y1), r2=103(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 79
LDI r2, 103
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
