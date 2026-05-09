; DESCRIPTION: Renders a orange line between points (212, 214) and (129, 137).
; PLAN: r0=212(x1), r1=214(y1), r2=129(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 214
LDI r2, 129
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
