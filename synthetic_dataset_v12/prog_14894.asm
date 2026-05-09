; DESCRIPTION: Draws a orange line from (320, 113) to (5, 185).
; PLAN: r0=320(x1), r1=113(y1), r2=5(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 113
LDI r2, 5
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
