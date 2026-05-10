; DESCRIPTION: Draws a blue line from (200, 53) to (11, 64).
; PLAN: r0=200(x1), r1=53(y1), r2=11(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 53
LDI r2, 11
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
