; DESCRIPTION: Renders a orange line between points (75, 133) and (350, 76).
; PLAN: r0=75(x1), r1=133(y1), r2=350(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 133
LDI r2, 350
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
