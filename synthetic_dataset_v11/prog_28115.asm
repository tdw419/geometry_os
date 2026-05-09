; DESCRIPTION: Places a red line segment connecting (208, 143) to (2, 70).
; PLAN: r0=208(x1), r1=143(y1), r2=2(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 143
LDI r2, 2
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
