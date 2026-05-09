; DESCRIPTION: Places a orange line segment connecting (36, 129) to (99, 121).
; PLAN: r0=36(x1), r1=129(y1), r2=99(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 129
LDI r2, 99
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
