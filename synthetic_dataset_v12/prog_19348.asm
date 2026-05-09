; DESCRIPTION: Places a blue line segment connecting (35, 129) to (382, 64).
; PLAN: r0=35(x1), r1=129(y1), r2=382(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 129
LDI r2, 382
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
