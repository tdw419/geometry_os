; DESCRIPTION: Draws a blue line from (390, 6) to (329, 184).
; PLAN: r0=390(x1), r1=6(y1), r2=329(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 6
LDI r2, 329
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
