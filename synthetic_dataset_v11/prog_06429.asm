; DESCRIPTION: Places a red line segment connecting (211, 1) to (206, 158).
; PLAN: r0=211(x1), r1=1(y1), r2=206(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 1
LDI r2, 206
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
