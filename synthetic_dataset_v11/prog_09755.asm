; DESCRIPTION: Renders a orange line between points (245, 66) and (101, 133).
; PLAN: r0=245(x1), r1=66(y1), r2=101(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 66
LDI r2, 101
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
