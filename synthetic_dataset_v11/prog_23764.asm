; DESCRIPTION: Places a red line segment connecting (222, 241) to (6, 189).
; PLAN: r0=222(x1), r1=241(y1), r2=6(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 241
LDI r2, 6
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
