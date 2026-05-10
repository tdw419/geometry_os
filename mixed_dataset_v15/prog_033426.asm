; DESCRIPTION: Draws a red line from (159, 125) to (390, 128).
; PLAN: r0=159(x1), r1=125(y1), r2=390(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 125
LDI r2, 390
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
