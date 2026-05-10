; DESCRIPTION: Draws a orange line from (289, 219) to (386, 155).
; PLAN: r0=289(x1), r1=219(y1), r2=386(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 219
LDI r2, 386
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
