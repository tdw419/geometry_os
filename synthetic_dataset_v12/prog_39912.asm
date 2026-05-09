; DESCRIPTION: Renders a orange line between points (231, 55) and (73, 58).
; PLAN: r0=231(x1), r1=55(y1), r2=73(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 55
LDI r2, 73
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
