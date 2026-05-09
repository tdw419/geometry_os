; DESCRIPTION: Renders a orange line between points (449, 95) and (301, 112).
; PLAN: r0=449(x1), r1=95(y1), r2=301(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 95
LDI r2, 301
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
