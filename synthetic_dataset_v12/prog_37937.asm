; DESCRIPTION: Places a red line segment connecting (419, 11) to (138, 81).
; PLAN: r0=419(x1), r1=11(y1), r2=138(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 11
LDI r2, 138
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
