; DESCRIPTION: Draws a red line from (396, 132) to (325, 238).
; PLAN: r0=396(x1), r1=132(y1), r2=325(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 132
LDI r2, 325
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
