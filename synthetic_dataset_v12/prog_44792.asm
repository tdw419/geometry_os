; DESCRIPTION: Renders a orange line between points (25, 172) and (431, 231).
; PLAN: r0=25(x1), r1=172(y1), r2=431(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 172
LDI r2, 431
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
