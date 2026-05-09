; DESCRIPTION: Places a red line segment connecting (56, 6) to (62, 171).
; PLAN: r0=56(x1), r1=6(y1), r2=62(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 6
LDI r2, 62
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
