; DESCRIPTION: Draws a blue line from (261, 113) to (287, 10).
; PLAN: r0=261(x1), r1=113(y1), r2=287(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 113
LDI r2, 287
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
