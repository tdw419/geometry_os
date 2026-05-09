; DESCRIPTION: Renders a orange line between points (211, 56) and (61, 214).
; PLAN: r0=211(x1), r1=56(y1), r2=61(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 56
LDI r2, 61
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
