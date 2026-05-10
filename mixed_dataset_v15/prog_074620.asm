; DESCRIPTION: Renders a orange line between points (169, 63) and (443, 168).
; PLAN: r0=169(x1), r1=63(y1), r2=443(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 63
LDI r2, 443
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
