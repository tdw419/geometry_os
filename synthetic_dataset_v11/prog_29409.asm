; DESCRIPTION: Places a red line segment connecting (251, 171) to (112, 188).
; PLAN: r0=251(x1), r1=171(y1), r2=112(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 171
LDI r2, 112
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
