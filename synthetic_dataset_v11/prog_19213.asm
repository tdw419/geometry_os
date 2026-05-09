; DESCRIPTION: Draws a orange line from (127, 122) to (218, 62).
; PLAN: r0=127(x1), r1=122(y1), r2=218(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 122
LDI r2, 218
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
