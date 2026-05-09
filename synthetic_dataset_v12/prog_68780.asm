; DESCRIPTION: Renders a blue line between points (436, 194) and (400, 175).
; PLAN: r0=436(x1), r1=194(y1), r2=400(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 194
LDI r2, 400
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
