; DESCRIPTION: Renders a orange line between points (449, 47) and (414, 4).
; PLAN: r0=449(x1), r1=47(y1), r2=414(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 47
LDI r2, 414
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
