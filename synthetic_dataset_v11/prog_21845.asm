; DESCRIPTION: Renders a blue line between points (200, 231) and (237, 117).
; PLAN: r0=200(x1), r1=231(y1), r2=237(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 231
LDI r2, 237
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
