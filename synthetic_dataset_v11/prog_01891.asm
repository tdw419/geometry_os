; DESCRIPTION: Places a blue line segment connecting (145, 113) to (39, 174).
; PLAN: r0=145(x1), r1=113(y1), r2=39(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 113
LDI r2, 39
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
