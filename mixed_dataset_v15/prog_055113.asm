; DESCRIPTION: Renders a blue line between points (473, 184) and (373, 3).
; PLAN: r0=473(x1), r1=184(y1), r2=373(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 184
LDI r2, 373
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
