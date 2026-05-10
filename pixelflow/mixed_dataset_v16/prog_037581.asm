; DESCRIPTION: Draws a blue line from (509, 106) to (471, 250).
; PLAN: r0=509(x1), r1=106(y1), r2=471(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 106
LDI r2, 471
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
