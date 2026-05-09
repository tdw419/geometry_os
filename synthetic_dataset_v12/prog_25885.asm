; DESCRIPTION: Renders a orange line between points (283, 3) and (169, 180).
; PLAN: r0=283(x1), r1=3(y1), r2=169(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 3
LDI r2, 169
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
