; DESCRIPTION: Draws a orange line from (379, 132) to (196, 3).
; PLAN: r0=379(x1), r1=132(y1), r2=196(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 132
LDI r2, 196
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
