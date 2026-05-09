; DESCRIPTION: Renders a blue line between points (404, 66) and (416, 133).
; PLAN: r0=404(x1), r1=66(y1), r2=416(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 66
LDI r2, 416
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
