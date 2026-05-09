; DESCRIPTION: Places a red line segment connecting (133, 47) to (107, 86).
; PLAN: r0=133(x1), r1=47(y1), r2=107(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 47
LDI r2, 107
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
