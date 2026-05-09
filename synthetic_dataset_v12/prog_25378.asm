; DESCRIPTION: Renders a yellow line between points (501, 32) and (337, 106).
; PLAN: r0=501(x1), r1=32(y1), r2=337(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 32
LDI r2, 337
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
