; DESCRIPTION: Renders a blue line between points (416, 116) and (194, 64).
; PLAN: r0=416(x1), r1=116(y1), r2=194(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 116
LDI r2, 194
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
