; DESCRIPTION: Renders a orange line between points (77, 107) and (95, 79).
; PLAN: r0=77(x1), r1=107(y1), r2=95(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 107
LDI r2, 95
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
