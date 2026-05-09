; DESCRIPTION: Draws a blue line from (193, 140) to (490, 209).
; PLAN: r0=193(x1), r1=140(y1), r2=490(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 140
LDI r2, 490
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
