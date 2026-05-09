; DESCRIPTION: Draws a orange line from (499, 135) to (419, 122).
; PLAN: r0=499(x1), r1=135(y1), r2=419(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 135
LDI r2, 419
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
