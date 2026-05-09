; DESCRIPTION: Renders a magenta line between points (312, 43) and (443, 241).
; PLAN: r0=312(x1), r1=43(y1), r2=443(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 43
LDI r2, 443
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
