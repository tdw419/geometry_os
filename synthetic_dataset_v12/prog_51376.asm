; DESCRIPTION: Renders a orange line between points (9, 34) and (131, 28).
; PLAN: r0=9(x1), r1=34(y1), r2=131(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 34
LDI r2, 131
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
