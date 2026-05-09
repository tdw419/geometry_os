; DESCRIPTION: Places a blue line segment connecting (500, 214) to (59, 53).
; PLAN: r0=500(x1), r1=214(y1), r2=59(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 214
LDI r2, 59
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
