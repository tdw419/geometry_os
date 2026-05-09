; DESCRIPTION: Renders a orange line between points (66, 226) and (162, 151).
; PLAN: r0=66(x1), r1=226(y1), r2=162(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 226
LDI r2, 162
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
