; DESCRIPTION: Draws a blue line from (155, 16) to (180, 31).
; PLAN: r0=155(x1), r1=16(y1), r2=180(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 16
LDI r2, 180
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
