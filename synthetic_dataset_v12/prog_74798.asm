; DESCRIPTION: Places a blue line segment connecting (500, 111) to (53, 32).
; PLAN: r0=500(x1), r1=111(y1), r2=53(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 111
LDI r2, 53
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
