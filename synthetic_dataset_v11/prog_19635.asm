; DESCRIPTION: Renders a purple line between points (128, 188) and (81, 59).
; PLAN: r0=128(x1), r1=188(y1), r2=81(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 188
LDI r2, 81
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
