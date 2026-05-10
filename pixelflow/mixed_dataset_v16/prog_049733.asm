; DESCRIPTION: Renders a orange line between points (145, 23) and (299, 214).
; PLAN: r0=145(x1), r1=23(y1), r2=299(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 23
LDI r2, 299
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
