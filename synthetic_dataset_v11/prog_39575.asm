; DESCRIPTION: Places a blue line segment connecting (240, 243) to (128, 133).
; PLAN: r0=240(x1), r1=243(y1), r2=128(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 243
LDI r2, 128
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
