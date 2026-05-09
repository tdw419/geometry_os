; DESCRIPTION: Draws a orange line from (254, 185) to (455, 79).
; PLAN: r0=254(x1), r1=185(y1), r2=455(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 185
LDI r2, 455
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
