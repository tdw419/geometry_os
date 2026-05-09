; DESCRIPTION: Renders a blue line between points (75, 181) and (74, 61).
; PLAN: r0=75(x1), r1=181(y1), r2=74(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 181
LDI r2, 74
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
