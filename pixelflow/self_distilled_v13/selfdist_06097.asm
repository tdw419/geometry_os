; DESCRIPTION: Draws a blue line from (236, 72) to (249, 140).
; PLAN: r0=236(x1), r1=72(y1), r2=249(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 72
LDI r2, 249
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
