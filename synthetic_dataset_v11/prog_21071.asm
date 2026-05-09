; DESCRIPTION: Draws a orange line from (55, 1) to (197, 160).
; PLAN: r0=55(x1), r1=1(y1), r2=197(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 1
LDI r2, 197
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
