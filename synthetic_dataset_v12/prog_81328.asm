; DESCRIPTION: Places a orange line segment connecting (238, 127) to (473, 129).
; PLAN: r0=238(x1), r1=127(y1), r2=473(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 127
LDI r2, 473
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
