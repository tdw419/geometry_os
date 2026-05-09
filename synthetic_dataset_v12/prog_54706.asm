; DESCRIPTION: Draws a orange line from (442, 219) to (182, 3).
; PLAN: r0=442(x1), r1=219(y1), r2=182(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 219
LDI r2, 182
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
