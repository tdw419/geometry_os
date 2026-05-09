; DESCRIPTION: Renders a blue line between points (27, 87) and (19, 133).
; PLAN: r0=27(x1), r1=87(y1), r2=19(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 87
LDI r2, 19
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
