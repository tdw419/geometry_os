; DESCRIPTION: Draws a orange line from (176, 121) to (396, 47).
; PLAN: r0=176(x1), r1=121(y1), r2=396(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 121
LDI r2, 396
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
