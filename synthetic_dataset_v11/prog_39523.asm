; DESCRIPTION: Draws a orange line from (145, 132) to (86, 50).
; PLAN: r0=145(x1), r1=132(y1), r2=86(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 132
LDI r2, 86
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
