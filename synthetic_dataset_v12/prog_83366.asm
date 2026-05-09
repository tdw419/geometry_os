; DESCRIPTION: Draws a orange line from (319, 44) to (200, 244).
; PLAN: r0=319(x1), r1=44(y1), r2=200(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 44
LDI r2, 200
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
