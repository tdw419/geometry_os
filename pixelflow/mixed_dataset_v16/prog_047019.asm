; DESCRIPTION: Renders a magenta line between points (94, 35) and (349, 49).
; PLAN: r0=94(x1), r1=35(y1), r2=349(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 35
LDI r2, 349
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
