; DESCRIPTION: Draws a blue line from (141, 226) to (134, 236).
; PLAN: r0=141(x1), r1=226(y1), r2=134(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 226
LDI r2, 134
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
