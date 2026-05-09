; DESCRIPTION: Renders a blue line between points (188, 128) and (175, 82).
; PLAN: r0=188(x1), r1=128(y1), r2=175(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 128
LDI r2, 175
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
