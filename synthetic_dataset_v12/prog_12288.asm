; DESCRIPTION: Places a red line segment connecting (53, 87) to (54, 57).
; PLAN: r0=53(x1), r1=87(y1), r2=54(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 87
LDI r2, 54
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
