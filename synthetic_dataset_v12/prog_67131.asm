; DESCRIPTION: Renders a orange line between points (233, 98) and (231, 194).
; PLAN: r0=233(x1), r1=98(y1), r2=231(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 98
LDI r2, 231
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
