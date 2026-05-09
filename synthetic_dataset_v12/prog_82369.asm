; DESCRIPTION: Places a orange line segment connecting (190, 43) to (84, 223).
; PLAN: r0=190(x1), r1=43(y1), r2=84(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 43
LDI r2, 84
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
