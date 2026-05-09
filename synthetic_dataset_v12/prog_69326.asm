; DESCRIPTION: Renders a orange line between points (83, 180) and (33, 184).
; PLAN: r0=83(x1), r1=180(y1), r2=33(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 180
LDI r2, 33
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
