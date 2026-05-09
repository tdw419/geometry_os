; DESCRIPTION: Draws a orange line from (37, 213) to (27, 110).
; PLAN: r0=37(x1), r1=213(y1), r2=27(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 213
LDI r2, 27
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
