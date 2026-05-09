; DESCRIPTION: Renders a orange line between points (146, 125) and (162, 124).
; PLAN: r0=146(x1), r1=125(y1), r2=162(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 125
LDI r2, 162
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
