; DESCRIPTION: Places a blue line segment connecting (194, 128) to (220, 204).
; PLAN: r0=194(x1), r1=128(y1), r2=220(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 128
LDI r2, 220
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
