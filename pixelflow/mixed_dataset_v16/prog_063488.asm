; DESCRIPTION: Renders a orange line between points (189, 168) and (194, 184).
; PLAN: r0=189(x1), r1=168(y1), r2=194(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 168
LDI r2, 194
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
