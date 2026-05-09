; DESCRIPTION: Draws a blue line from (127, 113) to (207, 140).
; PLAN: r0=127(x1), r1=113(y1), r2=207(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 113
LDI r2, 207
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
