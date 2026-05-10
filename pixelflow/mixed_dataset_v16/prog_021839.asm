; DESCRIPTION: Places a red line segment connecting (57, 61) to (330, 133).
; PLAN: r0=57(x1), r1=61(y1), r2=330(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 61
LDI r2, 330
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
