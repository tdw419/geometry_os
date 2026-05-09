; DESCRIPTION: Places a red line segment connecting (211, 74) to (317, 206).
; PLAN: r0=211(x1), r1=74(y1), r2=317(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 74
LDI r2, 317
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
