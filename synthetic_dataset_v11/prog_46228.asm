; DESCRIPTION: Renders a orange line between points (75, 114) and (177, 37).
; PLAN: r0=75(x1), r1=114(y1), r2=177(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 114
LDI r2, 177
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
