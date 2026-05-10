; DESCRIPTION: Renders a orange line between points (146, 192) and (443, 227).
; PLAN: r0=146(x1), r1=192(y1), r2=443(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 192
LDI r2, 443
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
