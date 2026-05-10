; DESCRIPTION: Renders a blue line between points (131, 86) and (94, 248).
; PLAN: r0=131(x1), r1=86(y1), r2=94(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 86
LDI r2, 94
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
