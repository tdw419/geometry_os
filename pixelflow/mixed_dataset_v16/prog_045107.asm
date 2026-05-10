; DESCRIPTION: Renders a orange line segment connecting (310, 145) to (39, 151).
; PLAN: r0=310(x1), r1=145(y1), r2=39(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 145
LDI r2, 39
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
