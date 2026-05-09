; DESCRIPTION: Renders a blue line between points (373, 255) and (26, 30).
; PLAN: r0=373(x1), r1=255(y1), r2=26(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 255
LDI r2, 26
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
