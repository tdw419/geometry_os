; DESCRIPTION: Draws a blue line from (78, 229) to (183, 105).
; PLAN: r0=78(x1), r1=229(y1), r2=183(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 229
LDI r2, 183
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
