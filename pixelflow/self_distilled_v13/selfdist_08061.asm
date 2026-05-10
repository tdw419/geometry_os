; DESCRIPTION: Draws a blue line from (229, 184) to (231, 112).
; PLAN: r0=229(x1), r1=184(y1), r2=231(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 184
LDI r2, 231
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
