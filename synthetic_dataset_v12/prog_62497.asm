; DESCRIPTION: Renders a orange line between points (287, 227) and (194, 151).
; PLAN: r0=287(x1), r1=227(y1), r2=194(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 227
LDI r2, 194
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
