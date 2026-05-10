; DESCRIPTION: Draws a purple line from (232, 113) to (386, 227).
; PLAN: r0=232(x1), r1=113(y1), r2=386(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 113
LDI r2, 386
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
