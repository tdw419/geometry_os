; DESCRIPTION: Draws a orange line from (55, 224) to (32, 229).
; PLAN: r0=55(x1), r1=224(y1), r2=32(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 224
LDI r2, 32
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
