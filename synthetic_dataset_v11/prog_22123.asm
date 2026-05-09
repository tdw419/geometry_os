; DESCRIPTION: Renders a blue line between points (90, 32) and (133, 128).
; PLAN: r0=90(x1), r1=32(y1), r2=133(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 32
LDI r2, 133
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
