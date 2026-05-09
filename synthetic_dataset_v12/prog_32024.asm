; DESCRIPTION: Renders a blue line between points (387, 65) and (370, 149).
; PLAN: r0=387(x1), r1=65(y1), r2=370(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 65
LDI r2, 370
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
