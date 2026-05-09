; DESCRIPTION: Renders a blue line between points (422, 108) and (330, 34).
; PLAN: r0=422(x1), r1=108(y1), r2=330(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 108
LDI r2, 330
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
