; DESCRIPTION: Places a red line segment connecting (76, 56) to (208, 74).
; PLAN: r0=76(x1), r1=56(y1), r2=208(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 56
LDI r2, 208
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
