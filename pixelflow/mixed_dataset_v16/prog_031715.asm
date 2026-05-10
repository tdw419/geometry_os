; DESCRIPTION: Places a red line segment connecting (222, 247) to (87, 118).
; PLAN: r0=222(x1), r1=247(y1), r2=87(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 247
LDI r2, 87
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
