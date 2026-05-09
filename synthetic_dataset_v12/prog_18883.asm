; DESCRIPTION: Renders a blue line between points (400, 37) and (446, 227).
; PLAN: r0=400(x1), r1=37(y1), r2=446(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 37
LDI r2, 446
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
