; DESCRIPTION: Renders a blue line between points (461, 32) and (37, 44).
; PLAN: r0=461(x1), r1=32(y1), r2=37(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 32
LDI r2, 37
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
