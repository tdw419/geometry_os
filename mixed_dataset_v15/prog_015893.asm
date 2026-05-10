; DESCRIPTION: Renders a blue line between points (389, 247) and (379, 63).
; PLAN: r0=389(x1), r1=247(y1), r2=379(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 247
LDI r2, 379
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
