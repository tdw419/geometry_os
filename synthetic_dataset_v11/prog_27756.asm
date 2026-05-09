; DESCRIPTION: Renders a orange line between points (68, 128) and (212, 252).
; PLAN: r0=68(x1), r1=128(y1), r2=212(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 128
LDI r2, 212
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
