; DESCRIPTION: Renders a orange line between points (265, 2) and (44, 168).
; PLAN: r0=265(x1), r1=2(y1), r2=44(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 2
LDI r2, 44
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
