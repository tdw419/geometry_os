; DESCRIPTION: Renders a yellow line between points (256, 62) and (490, 148).
; PLAN: r0=256(x1), r1=62(y1), r2=490(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 62
LDI r2, 490
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
