; DESCRIPTION: Places a yellow line segment connecting (419, 11) to (74, 247).
; PLAN: r0=419(x1), r1=11(y1), r2=74(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 11
LDI r2, 74
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
