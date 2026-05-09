; DESCRIPTION: Renders a orange line between points (264, 46) and (443, 141).
; PLAN: r0=264(x1), r1=46(y1), r2=443(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 46
LDI r2, 443
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
