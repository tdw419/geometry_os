; DESCRIPTION: Places a blue line segment connecting (103, 254) to (436, 38).
; PLAN: r0=103(x1), r1=254(y1), r2=436(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 254
LDI r2, 436
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
