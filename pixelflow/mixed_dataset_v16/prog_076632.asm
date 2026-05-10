; DESCRIPTION: Renders a blue line between points (94, 93) and (165, 4).
; PLAN: r0=94(x1), r1=93(y1), r2=165(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 93
LDI r2, 165
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
