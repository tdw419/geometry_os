; DESCRIPTION: Draws a orange line from (241, 130) to (25, 147).
; PLAN: r0=241(x1), r1=130(y1), r2=25(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 130
LDI r2, 25
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
