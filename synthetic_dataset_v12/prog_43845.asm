; DESCRIPTION: Renders a orange line between points (250, 226) and (281, 151).
; PLAN: r0=250(x1), r1=226(y1), r2=281(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 226
LDI r2, 281
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
