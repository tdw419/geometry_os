; DESCRIPTION: Draws a orange line from (387, 34) to (206, 4).
; PLAN: r0=387(x1), r1=34(y1), r2=206(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 34
LDI r2, 206
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
