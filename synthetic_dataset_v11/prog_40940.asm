; DESCRIPTION: Places a blue line segment connecting (90, 38) to (69, 204).
; PLAN: r0=90(x1), r1=38(y1), r2=69(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 38
LDI r2, 69
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
