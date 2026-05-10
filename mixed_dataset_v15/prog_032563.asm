; DESCRIPTION: Renders a orange line between points (281, 47) and (105, 77).
; PLAN: r0=281(x1), r1=47(y1), r2=105(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 47
LDI r2, 105
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
