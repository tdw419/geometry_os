; DESCRIPTION: Renders a orange line between points (26, 213) and (457, 151).
; PLAN: r0=26(x1), r1=213(y1), r2=457(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 213
LDI r2, 457
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
