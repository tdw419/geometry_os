; DESCRIPTION: Renders a orange line between points (301, 85) and (184, 151).
; PLAN: r0=301(x1), r1=85(y1), r2=184(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 85
LDI r2, 184
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
