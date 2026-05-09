; DESCRIPTION: Renders a orange line between points (359, 227) and (360, 151).
; PLAN: r0=359(x1), r1=227(y1), r2=360(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 227
LDI r2, 360
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
