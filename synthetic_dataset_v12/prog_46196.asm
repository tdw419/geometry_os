; DESCRIPTION: Renders a blue line between points (62, 167) and (12, 45).
; PLAN: r0=62(x1), r1=167(y1), r2=12(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 167
LDI r2, 12
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
