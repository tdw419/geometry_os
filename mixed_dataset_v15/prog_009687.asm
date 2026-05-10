; DESCRIPTION: Draws a orange line from (239, 127) to (80, 31).
; PLAN: r0=239(x1), r1=127(y1), r2=80(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 127
LDI r2, 80
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
