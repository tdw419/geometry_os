; DESCRIPTION: Renders a blue line between points (377, 32) and (337, 37).
; PLAN: r0=377(x1), r1=32(y1), r2=337(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 32
LDI r2, 337
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
