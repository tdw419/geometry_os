; DESCRIPTION: Draws a orange line from (418, 133) to (81, 24).
; PLAN: r0=418(x1), r1=133(y1), r2=81(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 133
LDI r2, 81
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
