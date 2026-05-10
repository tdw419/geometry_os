; DESCRIPTION: Places a orange line segment connecting (279, 226) to (76, 66).
; PLAN: r0=279(x1), r1=226(y1), r2=76(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 226
LDI r2, 76
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
