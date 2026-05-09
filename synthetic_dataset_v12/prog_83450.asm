; DESCRIPTION: Places a red line segment connecting (138, 90) to (292, 145).
; PLAN: r0=138(x1), r1=90(y1), r2=292(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 90
LDI r2, 292
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
