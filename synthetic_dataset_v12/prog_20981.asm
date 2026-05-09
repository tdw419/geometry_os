; DESCRIPTION: Renders a blue line between points (350, 80) and (403, 210).
; PLAN: r0=350(x1), r1=80(y1), r2=403(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 80
LDI r2, 403
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
