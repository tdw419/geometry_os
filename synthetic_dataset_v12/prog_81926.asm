; DESCRIPTION: Draws a orange line from (223, 181) to (371, 14).
; PLAN: r0=223(x1), r1=181(y1), r2=371(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 181
LDI r2, 371
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
