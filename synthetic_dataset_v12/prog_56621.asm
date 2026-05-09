; DESCRIPTION: Draws a orange line from (321, 238) to (398, 155).
; PLAN: r0=321(x1), r1=238(y1), r2=398(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 238
LDI r2, 398
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
