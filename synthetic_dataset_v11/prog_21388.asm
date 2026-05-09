; DESCRIPTION: Places a red line segment connecting (157, 146) to (221, 78).
; PLAN: r0=157(x1), r1=146(y1), r2=221(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 146
LDI r2, 221
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
