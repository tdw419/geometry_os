; DESCRIPTION: Draws a blue line from (108, 113) to (177, 165).
; PLAN: r0=108(x1), r1=113(y1), r2=177(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 113
LDI r2, 177
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
