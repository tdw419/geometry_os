; DESCRIPTION: Renders a magenta line between points (121, 94) and (388, 62).
; PLAN: r0=121(x1), r1=94(y1), r2=388(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 94
LDI r2, 388
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
