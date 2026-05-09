; DESCRIPTION: Places a red line segment connecting (72, 93) to (26, 49).
; PLAN: r0=72(x1), r1=93(y1), r2=26(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 93
LDI r2, 26
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
