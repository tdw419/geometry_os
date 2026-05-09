; DESCRIPTION: Renders a blue line between points (387, 49) and (367, 200).
; PLAN: r0=387(x1), r1=49(y1), r2=367(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 49
LDI r2, 367
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
