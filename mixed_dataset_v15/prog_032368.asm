; DESCRIPTION: Renders a blue line between points (305, 108) and (315, 189).
; PLAN: r0=305(x1), r1=108(y1), r2=315(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 108
LDI r2, 315
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
