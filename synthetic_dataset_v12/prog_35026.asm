; DESCRIPTION: Places a red line segment connecting (26, 108) to (413, 145).
; PLAN: r0=26(x1), r1=108(y1), r2=413(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 108
LDI r2, 413
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
