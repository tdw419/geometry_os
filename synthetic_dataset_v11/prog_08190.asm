; DESCRIPTION: Places a blue line segment connecting (129, 177) to (30, 255).
; PLAN: r0=129(x1), r1=177(y1), r2=30(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 177
LDI r2, 30
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
