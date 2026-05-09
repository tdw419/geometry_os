; DESCRIPTION: Places a blue line segment connecting (416, 251) to (209, 21).
; PLAN: r0=416(x1), r1=251(y1), r2=209(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 251
LDI r2, 209
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
