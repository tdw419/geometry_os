; DESCRIPTION: Places a blue line segment connecting (231, 142) to (239, 60).
; PLAN: r0=231(x1), r1=142(y1), r2=239(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 142
LDI r2, 239
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
