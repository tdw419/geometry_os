; DESCRIPTION: Draws a orange line from (496, 129) to (428, 2).
; PLAN: r0=496(x1), r1=129(y1), r2=428(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 129
LDI r2, 428
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
