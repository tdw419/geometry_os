; DESCRIPTION: Renders a purple line between points (269, 168) and (62, 30).
; PLAN: r0=269(x1), r1=168(y1), r2=62(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 168
LDI r2, 62
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
