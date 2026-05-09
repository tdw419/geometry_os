; DESCRIPTION: Renders a orange line between points (428, 53) and (334, 170).
; PLAN: r0=428(x1), r1=53(y1), r2=334(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 53
LDI r2, 334
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
