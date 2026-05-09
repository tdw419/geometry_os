; DESCRIPTION: Renders a blue line between points (193, 124) and (236, 116).
; PLAN: r0=193(x1), r1=124(y1), r2=236(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 124
LDI r2, 236
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
