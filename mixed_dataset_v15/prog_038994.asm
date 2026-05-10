; DESCRIPTION: Renders a blue line between points (5, 61) and (37, 168).
; PLAN: r0=5(x1), r1=61(y1), r2=37(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 61
LDI r2, 37
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
