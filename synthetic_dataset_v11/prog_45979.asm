; DESCRIPTION: Renders a blue line between points (142, 233) and (64, 8).
; PLAN: r0=142(x1), r1=233(y1), r2=64(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 233
LDI r2, 64
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
