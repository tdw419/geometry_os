; DESCRIPTION: Draws a orange line from (324, 188) to (273, 225).
; PLAN: r0=324(x1), r1=188(y1), r2=273(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 188
LDI r2, 273
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
