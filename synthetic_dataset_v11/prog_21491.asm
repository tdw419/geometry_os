; DESCRIPTION: Renders a orange line between points (234, 23) and (102, 45).
; PLAN: r0=234(x1), r1=23(y1), r2=102(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 23
LDI r2, 102
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
