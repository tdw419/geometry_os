; DESCRIPTION: Renders a blue line between points (337, 188) and (293, 220).
; PLAN: r0=337(x1), r1=188(y1), r2=293(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 188
LDI r2, 293
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
