; DESCRIPTION: Draws a orange line from (277, 184) to (441, 205).
; PLAN: r0=277(x1), r1=184(y1), r2=441(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 184
LDI r2, 441
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
