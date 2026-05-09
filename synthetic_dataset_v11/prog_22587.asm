; DESCRIPTION: Renders a blue line between points (232, 32) and (156, 254).
; PLAN: r0=232(x1), r1=32(y1), r2=156(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 32
LDI r2, 156
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
