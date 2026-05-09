; DESCRIPTION: Renders a blue line between points (113, 176) and (390, 255).
; PLAN: r0=113(x1), r1=176(y1), r2=390(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 176
LDI r2, 390
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
