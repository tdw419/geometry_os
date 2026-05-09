; DESCRIPTION: Draws a blue line from (169, 250) to (138, 167).
; PLAN: r0=169(x1), r1=250(y1), r2=138(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 250
LDI r2, 138
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
