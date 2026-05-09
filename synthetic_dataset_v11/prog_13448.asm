; DESCRIPTION: Draws a orange line from (243, 2) to (131, 123).
; PLAN: r0=243(x1), r1=2(y1), r2=131(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 2
LDI r2, 131
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
