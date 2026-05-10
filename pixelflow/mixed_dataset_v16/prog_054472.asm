; DESCRIPTION: Draws a blue line from (384, 113) to (265, 80).
; PLAN: r0=384(x1), r1=113(y1), r2=265(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 113
LDI r2, 265
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
