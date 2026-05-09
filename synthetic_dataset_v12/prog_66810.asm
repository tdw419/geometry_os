; DESCRIPTION: Renders a blue line between points (503, 236) and (337, 63).
; PLAN: r0=503(x1), r1=236(y1), r2=337(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 236
LDI r2, 337
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
