; DESCRIPTION: Renders a blue line between points (40, 112) and (422, 255).
; PLAN: r0=40(x1), r1=112(y1), r2=422(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 112
LDI r2, 422
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
