; DESCRIPTION: Draws a orange line from (56, 224) to (296, 54).
; PLAN: r0=56(x1), r1=224(y1), r2=296(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 224
LDI r2, 296
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
