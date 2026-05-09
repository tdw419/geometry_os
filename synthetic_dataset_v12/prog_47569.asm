; DESCRIPTION: Renders a orange line between points (259, 171) and (385, 51).
; PLAN: r0=259(x1), r1=171(y1), r2=385(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 171
LDI r2, 385
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
