; DESCRIPTION: Places a orange line segment connecting (36, 47) to (53, 37).
; PLAN: r0=36(x1), r1=47(y1), r2=53(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 47
LDI r2, 53
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
