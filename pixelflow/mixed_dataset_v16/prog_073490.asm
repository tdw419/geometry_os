; DESCRIPTION: Renders a blue line between points (57, 34) and (371, 219).
; PLAN: r0=57(x1), r1=34(y1), r2=371(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 34
LDI r2, 371
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
