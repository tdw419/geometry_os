; DESCRIPTION: Places a red line segment connecting (399, 0) to (222, 84).
; PLAN: r0=399(x1), r1=0(y1), r2=222(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 0
LDI r2, 222
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
