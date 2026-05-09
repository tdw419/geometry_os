; DESCRIPTION: Renders a blue line between points (456, 94) and (420, 133).
; PLAN: r0=456(x1), r1=94(y1), r2=420(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 94
LDI r2, 420
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
