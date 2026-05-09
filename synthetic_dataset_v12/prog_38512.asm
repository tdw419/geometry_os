; DESCRIPTION: Draws a orange line from (108, 127) to (22, 240).
; PLAN: r0=108(x1), r1=127(y1), r2=22(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 127
LDI r2, 22
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
