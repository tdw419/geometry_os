; DESCRIPTION: Renders a orange line between points (46, 134) and (145, 38).
; PLAN: r0=46(x1), r1=134(y1), r2=145(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 134
LDI r2, 145
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
