; DESCRIPTION: Renders a orange line between points (221, 138) and (102, 218).
; PLAN: r0=221(x1), r1=138(y1), r2=102(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 138
LDI r2, 102
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
