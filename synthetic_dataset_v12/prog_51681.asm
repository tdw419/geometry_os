; DESCRIPTION: Places a red line segment connecting (26, 157) to (279, 14).
; PLAN: r0=26(x1), r1=157(y1), r2=279(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 157
LDI r2, 279
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
