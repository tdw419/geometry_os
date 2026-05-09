; DESCRIPTION: Places a blue line segment connecting (454, 69) to (221, 243).
; PLAN: r0=454(x1), r1=69(y1), r2=221(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 69
LDI r2, 221
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
