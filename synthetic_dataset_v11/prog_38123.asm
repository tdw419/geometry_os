; DESCRIPTION: Draws a blue line from (33, 61) to (250, 8).
; PLAN: r0=33(x1), r1=61(y1), r2=250(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 61
LDI r2, 250
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
