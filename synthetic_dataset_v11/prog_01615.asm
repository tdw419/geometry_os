; DESCRIPTION: Places a purple line segment connecting (32, 255) to (150, 122).
; PLAN: r0=32(x1), r1=255(y1), r2=150(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 255
LDI r2, 150
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
