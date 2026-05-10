; DESCRIPTION: Draws a orange line from (326, 184) to (454, 90).
; PLAN: r0=326(x1), r1=184(y1), r2=454(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 184
LDI r2, 454
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
