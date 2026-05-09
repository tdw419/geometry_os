; DESCRIPTION: Renders a orange line between points (205, 131) and (493, 227).
; PLAN: r0=205(x1), r1=131(y1), r2=493(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 131
LDI r2, 493
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
