; DESCRIPTION: Places a blue line segment connecting (501, 177) to (256, 204).
; PLAN: r0=501(x1), r1=177(y1), r2=256(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 177
LDI r2, 256
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
