; DESCRIPTION: Renders a orange line between points (352, 175) and (454, 151).
; PLAN: r0=352(x1), r1=175(y1), r2=454(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 175
LDI r2, 454
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
