; DESCRIPTION: Draws a orange line from (178, 1) to (111, 216).
; PLAN: r0=178(x1), r1=1(y1), r2=111(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 1
LDI r2, 111
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
