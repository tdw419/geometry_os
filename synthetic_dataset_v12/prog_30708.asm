; DESCRIPTION: Draws a blue line from (489, 189) to (310, 113).
; PLAN: r0=489(x1), r1=189(y1), r2=310(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 189
LDI r2, 310
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
