; DESCRIPTION: Draws a blue line from (400, 142) to (463, 122).
; PLAN: r0=400(x1), r1=142(y1), r2=463(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 142
LDI r2, 463
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
