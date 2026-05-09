; DESCRIPTION: Draws a blue line from (131, 113) to (31, 84).
; PLAN: r0=131(x1), r1=113(y1), r2=31(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 113
LDI r2, 31
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
