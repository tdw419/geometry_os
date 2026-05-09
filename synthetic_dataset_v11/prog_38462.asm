; DESCRIPTION: Renders a orange line between points (66, 226) and (177, 77).
; PLAN: r0=66(x1), r1=226(y1), r2=177(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 226
LDI r2, 177
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
