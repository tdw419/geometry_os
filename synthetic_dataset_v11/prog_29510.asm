; DESCRIPTION: Draws a orange line from (132, 18) to (219, 8).
; PLAN: r0=132(x1), r1=18(y1), r2=219(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 18
LDI r2, 219
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
