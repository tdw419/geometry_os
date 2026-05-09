; DESCRIPTION: Renders a orange line between points (81, 193) and (396, 151).
; PLAN: r0=81(x1), r1=193(y1), r2=396(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 193
LDI r2, 396
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
