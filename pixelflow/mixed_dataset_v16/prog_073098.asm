; DESCRIPTION: Renders a blue line between points (120, 68) and (508, 219).
; PLAN: r0=120(x1), r1=68(y1), r2=508(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 68
LDI r2, 508
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
