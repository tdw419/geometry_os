; DESCRIPTION: Places a blue line segment connecting (103, 24) to (500, 93).
; PLAN: r0=103(x1), r1=24(y1), r2=500(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 24
LDI r2, 500
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
