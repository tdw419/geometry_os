; DESCRIPTION: Renders a blue line between points (343, 124) and (473, 175).
; PLAN: r0=343(x1), r1=124(y1), r2=473(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 124
LDI r2, 473
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
