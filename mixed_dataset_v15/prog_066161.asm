; DESCRIPTION: Places a red line segment connecting (142, 40) to (304, 74).
; PLAN: r0=142(x1), r1=40(y1), r2=304(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 40
LDI r2, 304
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
