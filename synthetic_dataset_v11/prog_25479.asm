; DESCRIPTION: Renders a blue line between points (36, 176) and (210, 116).
; PLAN: r0=36(x1), r1=176(y1), r2=210(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 176
LDI r2, 210
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
