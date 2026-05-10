; DESCRIPTION: Renders a orange line between points (58, 131) and (6, 58).
; PLAN: r0=58(x1), r1=131(y1), r2=6(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 131
LDI r2, 6
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
