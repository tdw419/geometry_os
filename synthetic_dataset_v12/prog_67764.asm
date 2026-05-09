; DESCRIPTION: Draws a orange line from (432, 87) to (224, 129).
; PLAN: r0=432(x1), r1=87(y1), r2=224(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 87
LDI r2, 224
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
