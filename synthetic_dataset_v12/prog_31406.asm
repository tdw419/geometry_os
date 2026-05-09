; DESCRIPTION: Renders a blue line between points (312, 85) and (307, 38).
; PLAN: r0=312(x1), r1=85(y1), r2=307(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 85
LDI r2, 307
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
