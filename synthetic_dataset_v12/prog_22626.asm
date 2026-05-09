; DESCRIPTION: Renders a orange line between points (432, 7) and (231, 224).
; PLAN: r0=432(x1), r1=7(y1), r2=231(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 7
LDI r2, 231
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
