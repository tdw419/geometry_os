; DESCRIPTION: Draws a yellow line from (419, 132) to (396, 25).
; PLAN: r0=419(x1), r1=132(y1), r2=396(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 132
LDI r2, 396
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
