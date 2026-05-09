; DESCRIPTION: Draws a orange line from (204, 156) to (329, 14).
; PLAN: r0=204(x1), r1=156(y1), r2=329(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 156
LDI r2, 329
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
