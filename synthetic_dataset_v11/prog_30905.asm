; DESCRIPTION: Renders a blue line between points (32, 79) and (219, 104).
; PLAN: r0=32(x1), r1=79(y1), r2=219(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 79
LDI r2, 219
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
