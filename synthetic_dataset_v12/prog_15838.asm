; DESCRIPTION: Renders a orange line between points (58, 85) and (133, 192).
; PLAN: r0=58(x1), r1=85(y1), r2=133(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 85
LDI r2, 133
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
