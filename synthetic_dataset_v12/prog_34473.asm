; DESCRIPTION: Draws a blue line from (180, 169) to (76, 214).
; PLAN: r0=180(x1), r1=169(y1), r2=76(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 169
LDI r2, 76
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
