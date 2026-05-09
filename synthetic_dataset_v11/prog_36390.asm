; DESCRIPTION: Places a blue line segment connecting (93, 130) to (131, 83).
; PLAN: r0=93(x1), r1=130(y1), r2=131(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 130
LDI r2, 131
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
