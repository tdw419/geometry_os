; DESCRIPTION: Draws a orange line from (482, 127) to (1, 168).
; PLAN: r0=482(x1), r1=127(y1), r2=1(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 127
LDI r2, 1
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
