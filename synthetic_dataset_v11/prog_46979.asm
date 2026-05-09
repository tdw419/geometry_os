; DESCRIPTION: Renders a orange line between points (245, 74) and (99, 4).
; PLAN: r0=245(x1), r1=74(y1), r2=99(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 74
LDI r2, 99
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
