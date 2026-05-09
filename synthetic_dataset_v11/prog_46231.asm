; DESCRIPTION: Draws a orange line from (151, 105) to (218, 75).
; PLAN: r0=151(x1), r1=105(y1), r2=218(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 105
LDI r2, 218
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
