; DESCRIPTION: Draws a orange line from (502, 78) to (203, 149).
; PLAN: r0=502(x1), r1=78(y1), r2=203(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 78
LDI r2, 203
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
