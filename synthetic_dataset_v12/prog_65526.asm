; DESCRIPTION: Renders a blue line between points (164, 101) and (304, 118).
; PLAN: r0=164(x1), r1=101(y1), r2=304(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 101
LDI r2, 304
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
