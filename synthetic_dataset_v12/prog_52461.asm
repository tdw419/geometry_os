; DESCRIPTION: Draws a orange line from (424, 106) to (28, 221).
; PLAN: r0=424(x1), r1=106(y1), r2=28(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 106
LDI r2, 28
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
