; DESCRIPTION: Places a blue line segment connecting (412, 67) to (226, 255).
; PLAN: r0=412(x1), r1=67(y1), r2=226(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 67
LDI r2, 226
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
