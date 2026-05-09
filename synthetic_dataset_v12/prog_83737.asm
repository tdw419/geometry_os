; DESCRIPTION: Places a blue line segment connecting (500, 61) to (416, 103).
; PLAN: r0=500(x1), r1=61(y1), r2=416(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 61
LDI r2, 416
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
