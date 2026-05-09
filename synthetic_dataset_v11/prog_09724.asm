; DESCRIPTION: Places a red line segment connecting (61, 193) to (111, 85).
; PLAN: r0=61(x1), r1=193(y1), r2=111(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 193
LDI r2, 111
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
