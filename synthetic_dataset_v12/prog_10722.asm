; DESCRIPTION: Renders a blue line between points (180, 94) and (244, 220).
; PLAN: r0=180(x1), r1=94(y1), r2=244(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 94
LDI r2, 244
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
