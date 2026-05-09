; DESCRIPTION: Draws a magenta line from (155, 70) to (76, 184).
; PLAN: r0=155(x1), r1=70(y1), r2=76(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 70
LDI r2, 76
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
