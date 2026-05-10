; DESCRIPTION: Places a purple line segment connecting (493, 255) to (310, 76).
; PLAN: r0=493(x1), r1=255(y1), r2=310(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 255
LDI r2, 310
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
