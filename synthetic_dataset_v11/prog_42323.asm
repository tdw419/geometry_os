; DESCRIPTION: Places a red line segment connecting (222, 126) to (37, 148).
; PLAN: r0=222(x1), r1=126(y1), r2=37(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 126
LDI r2, 37
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
