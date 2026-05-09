; DESCRIPTION: Places a blue line segment connecting (220, 65) to (192, 197).
; PLAN: r0=220(x1), r1=65(y1), r2=192(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 65
LDI r2, 192
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
