; DESCRIPTION: Draws a blue line from (201, 29) to (299, 48).
; PLAN: r0=201(x1), r1=29(y1), r2=299(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 29
LDI r2, 299
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
