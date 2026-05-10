; DESCRIPTION: Renders a blue line between points (371, 120) and (403, 200).
; PLAN: r0=371(x1), r1=120(y1), r2=403(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 120
LDI r2, 403
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
