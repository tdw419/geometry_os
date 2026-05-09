; DESCRIPTION: Places a red line segment connecting (473, 149) to (324, 78).
; PLAN: r0=473(x1), r1=149(y1), r2=324(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 149
LDI r2, 324
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
