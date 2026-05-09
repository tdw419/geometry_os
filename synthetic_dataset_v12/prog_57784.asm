; DESCRIPTION: Renders a yellow line between points (56, 68) and (443, 43).
; PLAN: r0=56(x1), r1=68(y1), r2=443(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 68
LDI r2, 443
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
