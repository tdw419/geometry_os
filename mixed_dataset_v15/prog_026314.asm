; DESCRIPTION: Places a blue line segment connecting (207, 127) to (137, 38).
; PLAN: r0=207(x1), r1=127(y1), r2=137(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 127
LDI r2, 137
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
