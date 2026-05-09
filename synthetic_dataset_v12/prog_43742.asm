; DESCRIPTION: Draws a orange line from (141, 84) to (320, 18).
; PLAN: r0=141(x1), r1=84(y1), r2=320(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 84
LDI r2, 320
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
