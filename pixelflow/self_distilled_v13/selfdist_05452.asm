; DESCRIPTION: Draws a blue line from (113, 171) to (310, 94).
; PLAN: r0=113(x1), r1=171(y1), r2=310(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 171
LDI r2, 310
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
