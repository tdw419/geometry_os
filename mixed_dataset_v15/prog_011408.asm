; DESCRIPTION: Draws a orange line from (181, 192) to (69, 218).
; PLAN: r0=181(x1), r1=192(y1), r2=69(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 192
LDI r2, 69
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
