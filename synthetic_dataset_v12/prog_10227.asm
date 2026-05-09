; DESCRIPTION: Draws a blue line from (63, 170) to (348, 188).
; PLAN: r0=63(x1), r1=170(y1), r2=348(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 170
LDI r2, 348
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
