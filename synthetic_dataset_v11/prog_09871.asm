; DESCRIPTION: Draws a blue line from (78, 93) to (205, 105).
; PLAN: r0=78(x1), r1=93(y1), r2=205(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 93
LDI r2, 205
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
