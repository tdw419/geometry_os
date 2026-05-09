; DESCRIPTION: Draws a blue line from (448, 75) to (415, 101).
; PLAN: r0=448(x1), r1=75(y1), r2=415(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 75
LDI r2, 415
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
