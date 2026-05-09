; DESCRIPTION: Draws a blue line from (210, 142) to (80, 6).
; PLAN: r0=210(x1), r1=142(y1), r2=80(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 142
LDI r2, 80
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
