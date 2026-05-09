; DESCRIPTION: Renders a orange line between points (315, 127) and (134, 151).
; PLAN: r0=315(x1), r1=127(y1), r2=134(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 127
LDI r2, 134
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
