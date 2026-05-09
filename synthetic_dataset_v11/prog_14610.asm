; DESCRIPTION: Renders a orange line between points (190, 137) and (68, 91).
; PLAN: r0=190(x1), r1=137(y1), r2=68(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 137
LDI r2, 68
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
