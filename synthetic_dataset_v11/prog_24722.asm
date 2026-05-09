; DESCRIPTION: Renders a purple line between points (62, 111) and (54, 82).
; PLAN: r0=62(x1), r1=111(y1), r2=54(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 111
LDI r2, 54
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
