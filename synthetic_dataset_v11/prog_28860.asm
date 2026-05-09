; DESCRIPTION: Places a blue line segment connecting (210, 59) to (56, 204).
; PLAN: r0=210(x1), r1=59(y1), r2=56(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 59
LDI r2, 56
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
