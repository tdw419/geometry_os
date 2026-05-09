; DESCRIPTION: Renders a blue line between points (387, 45) and (94, 24).
; PLAN: r0=387(x1), r1=45(y1), r2=94(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 45
LDI r2, 94
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
