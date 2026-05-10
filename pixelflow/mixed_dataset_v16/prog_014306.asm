; DESCRIPTION: Draws a orange line from (240, 63) to (200, 80).
; PLAN: r0=240(x1), r1=63(y1), r2=200(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 63
LDI r2, 200
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
