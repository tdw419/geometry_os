; DESCRIPTION: Places a red line segment connecting (463, 167) to (292, 133).
; PLAN: r0=463(x1), r1=167(y1), r2=292(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 167
LDI r2, 292
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
