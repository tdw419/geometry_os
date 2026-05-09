; DESCRIPTION: Renders a blue line between points (60, 195) and (222, 62).
; PLAN: r0=60(x1), r1=195(y1), r2=222(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 195
LDI r2, 222
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
