; DESCRIPTION: Places a red line segment connecting (411, 133) to (33, 121).
; PLAN: r0=411(x1), r1=133(y1), r2=33(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 133
LDI r2, 33
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
