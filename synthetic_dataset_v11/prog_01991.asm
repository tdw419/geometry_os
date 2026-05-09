; DESCRIPTION: Places a red line segment connecting (137, 127) to (11, 223).
; PLAN: r0=137(x1), r1=127(y1), r2=11(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 127
LDI r2, 11
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
