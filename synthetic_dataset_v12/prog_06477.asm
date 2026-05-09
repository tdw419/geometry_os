; DESCRIPTION: Renders a blue line between points (300, 133) and (261, 165).
; PLAN: r0=300(x1), r1=133(y1), r2=261(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 133
LDI r2, 261
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
