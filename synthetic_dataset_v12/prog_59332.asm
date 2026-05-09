; DESCRIPTION: Draws a orange line from (272, 112) to (402, 106).
; PLAN: r0=272(x1), r1=112(y1), r2=402(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 112
LDI r2, 402
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
