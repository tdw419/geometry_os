; DESCRIPTION: Places a blue line segment connecting (231, 113) to (360, 43).
; PLAN: r0=231(x1), r1=113(y1), r2=360(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 113
LDI r2, 360
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
