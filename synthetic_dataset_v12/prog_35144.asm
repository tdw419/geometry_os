; DESCRIPTION: Renders a orange line between points (457, 232) and (360, 180).
; PLAN: r0=457(x1), r1=232(y1), r2=360(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 232
LDI r2, 360
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
