; DESCRIPTION: Renders a blue line between points (83, 142) and (449, 57).
; PLAN: r0=83(x1), r1=142(y1), r2=449(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 142
LDI r2, 449
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
